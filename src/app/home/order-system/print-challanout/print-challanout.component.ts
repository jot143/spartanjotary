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
    }
  }
}
