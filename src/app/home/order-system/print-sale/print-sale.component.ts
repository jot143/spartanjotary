import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OrderSystemService } from '../order-system.service';

@Component({
  selector: 'app-print-sale',
  templateUrl: './print-sale.component.html',
  styleUrls: ['./print-sale.component.scss']
})
export class PrintSaleComponent implements OnInit {

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
    order.subtotal = 0;
    order.total = 0;
    order.sgst = order.cgst = order.igst = order.gst = 0;

    for (const x of order.items) {
      x.amount = x.price * x.quantity;
      x.discount_percent = Number(x.discount_percent) + Number(order.discount_percent);
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

      x.total_amount = (x.amount_aft_discount + x.gst).toFixed(2);

      order.sgst_percent = 6;
      order.cgst_percent = 6;
      order.igst_percent = 0;
      order.sgst += Number(x.sgst);
      order.cgst += Number(x.cgst);
      order.igst += Number(x.igst);

      order.gst += Number(x.gst);
      order.taxable_amount += Number(x.amount_aft_discount);
      order.subtotal += Number(x.total_amount);
    }

    order.gst = Math.round(order.gst);
    order.subtotal = Math.round(order.subtotal);

    order.taxable_amount = Math.round(order.taxable_amount);
    order.discount = Math.round(  (order.subtotal * order.discount_percent / 100));
  }

}
