import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OrderSystemService } from '../order-system.service';

@Component({
  selector: 'app-print-challanout',
  templateUrl: './print-challanout.component.html',
  styleUrls: ['./print-challanout.component.scss']
})
export class PrintChallanoutComponent implements OnInit {

  activeRouteSubscriber: any;
  object: any;
  schema: any;
  order: any;
  constructor(
    public activeRoute: ActivatedRoute,
    public orderSystemService: OrderSystemService,
    public router: Router
    ) { }

  ngOnInit() {
    this.activeRouteSubscriber = this.activeRoute.data.subscribe((data: any) => {
      this.object = data.object;
      this.schema = data.schema;
    });

    this.order = this.orderSystemService.printObject;
    if (this.order === null ) {
      this.router.navigate(['']);
    } else {
      console.log(this.order);
      this.filterOrder(this.order);
    }
  }

  filterOrder(order) {
    order.taxable_amount = 0;
    order.total = 0;
    order.gst = 0;
    for (const x of order.items) {
      x.amount = x.price * x.quantity;
      x.discount = (x.amount * x.discount_percent / 100).toFixed(2);
      x.amount_aft_discount = x.amount - x.discount;

      // tslint:disable-next-line:triple-equals
      if ( order.gst_type == 'sgst-cgst') {
        x.sgst_percent = (x.cgst_percent =  x.product_id_detail.gstpercentage / 2).toFixed(2);
        x.sgst = x.cgst = (x.sgst_percent * x.amount_aft_discount / 100).toFixed(2);
        x.gst = x.sgst * 2;
        x.igst_percent = x.igst = 0;
      } else {
        x.sgst_percent = x.cgst_percent = x.sgst = x.cgst = 0;
        x.igst_percent = x.product_id_detail.gstpercentage;
        x.gst = x.igst = (x.igst_percent * x.amount_aft_discount / 100).toFixed(2);
      }

      x.total_amount = x.amount_aft_discount + x.gst;

      order.gst += x.gst;
      order.taxable_amount += x.amount_aft_discount;
      order.total += x.total_amount;
    }
  }

}
