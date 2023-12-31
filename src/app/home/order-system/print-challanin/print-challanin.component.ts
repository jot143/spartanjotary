import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OrderSystemService } from '../order-system.service';

@Component({
  selector: 'app-print-challanin',
  templateUrl: './print-challanin.component.html',
  styleUrls: ['./print-challanin.component.scss']
})
export class PrintChallaninComponent implements OnInit {

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
     // this.filterOrder(this.order);
    }
  }

}
