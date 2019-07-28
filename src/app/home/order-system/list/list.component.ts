import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { OrderSystemService } from '../order-system.service';
import { Observable } from 'rxjs';
import { SubjectService } from '../../persons/service/subject.service';
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

  $subject: any = {};
  Me: any = this;

  formView: any = false;

  constructor(public activeRoute: ActivatedRoute,
              public alertService: AlertService,
              public userService: UserService,
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

  viewMe(x) {
    this.formView = x;
    this.orderSystemService.getItems(this.formView, this.schema);
  }

}
