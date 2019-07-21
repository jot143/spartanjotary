import { Component, OnInit, Input, ElementRef } from '@angular/core';
import { OrderSystemService } from '../order-system.service';
import { AlertService } from 'src/core/components';

@Component({
  selector: 'app-form-builder',
  templateUrl: './form-builder.component.html',
  styleUrls: ['./form-builder.component.scss']
})
export class FormBuilderComponent implements OnInit {
  @Input() formData: any;
  @Input() callback: any;
  @Input() parent: any;

  callbackNew: any;
  constructor(public orderSystemService: OrderSystemService,
              public alertService: AlertService,
              private dom: ElementRef,
  ) { }

  ngOnInit() {
    this.callbackNew = {
      closeModels: () => {
        const models = this.dom.nativeElement.querySelectorAll('button[data-dismiss="modal"]');
        for (const x of models) {
          x.click();
        }
      }
    };
  }

  closeModels() {
    const models = this.dom.nativeElement.querySelectorAll('button[data-dismiss="modal"]');
    console.log(models);
    for (const x of models) {
      x.click();
    }
  }

  deleteItem(i, ary) {
    ary = ary.splice(i, 1);
  }

  submit(formData) {

    const response = {};
    for (const i of Object.keys(formData)) {
      // tslint:disable-next-line:triple-equals
      if (typeof formData[i].validate != 'undefined') {
        const res = formData[i].validate(formData[i], formData);
        if (res !== true) {
          this.alertService.error(res.msg);
          return;
        }
      }

      // tslint:disable-next-line:triple-equals
      if (i != 'submit') {
        response[i] = formData[i].value;

        // tslint:disable-next-line:triple-equals
        if (formData[i].type == 'autocomplete') {
          formData[i].typing = '';
          formData[i].searchList = [];
          formData[i].value = formData[i].quantity;
        }

      }
    }

    // tslint:disable-next-line:triple-equals
    formData.submit.action(response, this.parent);
    this.callback.closeModels();
  }

}
