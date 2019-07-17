import { Component, OnInit, OnDestroy, ViewEncapsulation } from '@angular/core';
import { Route, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { SubjectService } from '../persons/service/subject.service';

@Component({
  selector: 'app-order-system',
  templateUrl: './order-system.component.html',
  styleUrls: ['./order-system.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class OrderSystemComponent implements OnInit, OnDestroy {
  activeRouteSubscriber: any;
  subjectServiceSubscriber: any;
  object: any;
  schema: any;

  form: any;

  constructor(public activeRoute: ActivatedRoute, public subjectService: SubjectService) {

  }

  ngOnInit() {
    this.subjectServiceSubscriber = this.subjectService.$subjects.subscribe();
    this.activeRouteSubscriber = this.activeRoute.data.subscribe((data: any) => {
      this.object = data.object;
      this.schema = data.schema;
    });
  }

  ngOnDestroy() {
    this.activeRouteSubscriber.unsubscribe();
    this.subjectServiceSubscriber.unsubscribe();
  }

  autocomplete(form) {
    form.searchList = [];
    if (form.typing === '') {
      return;
    }
    const search = (arry) => {
      const emptyAry = [];
      for (const x of arry) {
        if (x.name.toLowerCase().search(form.typing.toLowerCase()) > -1) {
          emptyAry.push(x);
        } else {
          if (x.children && x.children.length > 0) {
            const childAry = search(x.children);
            if (childAry.length > 0) {
              for (const i of childAry) {
                emptyAry.push(i);
              }
            }
          }
        }
      }

      return emptyAry;
    };
    if (form.from.type === 'service') {
      const res = form.from.value.split('.');
      const serviceName = res[0];
      const serviceProperty = res[1];
      const service = this;
      form.searchList = search(service[serviceName][serviceProperty]);
    }
  }
}
