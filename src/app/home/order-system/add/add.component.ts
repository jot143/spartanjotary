import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OrderSystemService } from '../order-system.service';
import { AlertService, LoaderService } from 'src/core/components';
import { UserService } from 'src/core/services';
import { PersonService } from '../../persons/service/person.service';

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
              public personService: PersonService,
              public orderSystemService: OrderSystemService,
              public alertService: AlertService,
              public userService: UserService,
              public loaderService: LoaderService,
              public router: Router

    ) { }

  ngOnInit() {
    this.subjectServiceSubscriber = this.personService.$persons.subscribe();
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
    const parameter: any = {};
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
        parameter[i] = formData[i].value;
      }
    }

    parameter.schema = schema.object;
    parameter.created_by = this.userService.cId();

    const response = this.orderSystemService.add(parameter, schema);
    this.loaderService.start('Please Wait...', true);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.router.navigate(['home/order-system/' + schema.object + '/list']);
        this.alertService.success(res.msg);
      } else {
        this.alertService.error(res.msg);
      }
    });
  }
}
