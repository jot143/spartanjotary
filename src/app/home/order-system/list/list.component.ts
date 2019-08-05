import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { OrderSystemService } from '../order-system.service';
import { AlertService } from 'src/core/components';
import { UserService } from 'src/core/services';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})
export class ListComponent implements OnInit {
  activeRouteSubscriber: any;
  object: any;
  schema: any;

  ViewFormBtn: any = [];

  $subject: any = {};
  Me: any = this;

  formView: any = false;

  constructor(public activeRoute: ActivatedRoute,
              public alertService: AlertService,
              public userService: UserService,
              public router: Router,
              public orderSystemService: OrderSystemService) {

  }

  ngOnInit() {
    this.activeRouteSubscriber = this.activeRoute.data.subscribe((data: any) => {
      this.object = data.object;
      this.schema = data.schema;

      this.$subject[this.schema.object] = this.orderSystemService.getAll(this.object, this.schema);
    });
  }

  stockIn(x, schema) {
    x.created_by = this.userService.cId();
    x.schema = schema.object;
    this.orderSystemService.stockIn(x).subscribe((res: any) => {
        // tslint:disable-next-line:triple-equals
        if (res.status == 'success') {
          this.$subject[this.schema.object] = this.orderSystemService.getAll(this.object, this.schema);
          this.alertService.success(res.msg);
        } else {
          this.alertService.error(res.msg);
        }
    });
  }

  stockOut(x, schema) {
    x.created_by = this.userService.cId();
    x.schema = schema.object;
    this.orderSystemService.stockOut(x).subscribe((res: any) => {
        // tslint:disable-next-line:triple-equals
        if (res.status == 'success') {
          this.$subject[this.schema.object] = this.orderSystemService.getAll(this.object, this.schema);
          this.alertService.success(res.msg);
        } else {
          this.alertService.error(res.msg);
        }
    });
  }

  delete(x, schema) {
    x.created_by = this.userService.cId();
    x.schema = schema.object;
    this.orderSystemService.delete(x).subscribe((res: any) => {
        // tslint:disable-next-line:triple-equals
        if (res.status == 'success') {
          this.$subject[this.schema.object] = this.orderSystemService.getAll(this.object, this.schema);
          this.alertService.success(res.msg);
        } else {
          this.alertService.error(res.msg);
        }
    });
  }

  viewMe(x) {
    this.formView = x;
    this.orderSystemService.getItems(this.formView, this.schema);
    // tslint:disable-next-line:triple-equals
    if (this.schema.object == 'sale') {
      this.ViewFormBtn = ['print', 'print-packing'];
    } else {
      this.ViewFormBtn = ['print'];
    }

  }

  deleteMe(x) {
    this.formView = x;
    this.orderSystemService.getItems(this.formView, this.schema);
    this.ViewFormBtn = ['delete'];
  }

  stockInMe(x) {
    this.formView = x;
    this.orderSystemService.getItems(this.formView, this.schema);
    this.ViewFormBtn = ['stockin'];
  }

  GotoPrint(formView) {
    const url = '/home/order-system/' + this.schema.object + '/print';
    this.orderSystemService.printObject = formView;
    this.router.navigate([url] );
  }

  GotoPrintPakingSlip(formView) {
    const url = '/home/order-system/' + this.schema.object + '/print-packing';
    this.orderSystemService.printObject = formView;
    this.router.navigate([url] );
  }


}
