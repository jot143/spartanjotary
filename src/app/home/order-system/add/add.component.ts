import { Component, OnInit, OnDestroy } from '@angular/core';
import { SubjectService } from '../../persons/service/subject.service';
import { ActivatedRoute } from '@angular/router';
import { OrderSystemService } from '../order-system.service';
import { AlertService } from 'src/core/components';

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.scss']
})
export class AddComponent implements OnInit, OnDestroy {

  activeRouteSubscriber: any;
  subjectServiceSubscriber: any;
  object: any;
  schema: any;

  constructor(public activeRoute: ActivatedRoute,
              public subjectService: SubjectService,
              public orderSystemService: OrderSystemService,
              public alertService: AlertService
    ) { }

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

  submit(formData, schema) {
    const response = {};
    for (const i of Object.keys(formData)) {
      // tslint:disable-next-line:triple-equals
      if (typeof formData[i].validate != 'undefined') {
        const res = formData[i].validate(formData[i], formData);
        // tslint:disable-next-line:triple-equals
        if (typeof res == 'undefined') {
          console.log(i);
        }
        if (res !== true) {
          this.alertService.error(res.msg);
          return;
        }
      }

      // tslint:disable-next-line:triple-equals
      if (i != 'submit') {
        response[i] = formData[i].value;
      }
    }

    // tslint:disable-next-line:variable-name



    // tslint:disable-next-line:triple-equals
    // formData.submit.action(response, this.parent);
    // this.callback.closeModels();
  }
}
