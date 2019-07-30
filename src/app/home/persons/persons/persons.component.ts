import { Component, OnInit, ElementRef } from '@angular/core';
import { AlertService, LoaderService } from 'src/core/components';
import { RestApiService } from 'src/core/services/rest-api.service';
import { PersonService } from '../service/person.service';

@Component({
  selector: 'app-persons',
  templateUrl: './persons.component.html',
  styleUrls: ['./persons.component.scss']
})
export class PersonsComponent implements OnInit {

  form: any = {
    name: '',
    contactperson: '',
    street: '',
    city: '',
    pincode: '',
    state: '',
    country: 'india',
    gsttype: 'unregister',
    gstin: '',
    cin: '',
    mobile: '',
    tel: '',
    email: ''

  };
  formEdit: any = {};
  formView: any = {};

  parentsearch = '';
  parentsearchList = [];
  selectedParent: any = { id: 0, name: 'No Parent', parent_id: 0 };

  viewSubject: any = {};
  editSubject: any = {};
  deleteSubject: any = {};
  newSubject: any = {};
  callback = {
    action: (x) => {
      this.parentsearchList = [];
      this.parentsearch = x.name;
      this.newSubject.category_id = x.id;
      this.selectedParent = x;
    },
  };

  constructor(public personService: PersonService,
              private dom: ElementRef,
              public alertService: AlertService,
              public loaderService: LoaderService,
              public restapi: RestApiService
  ) { }

  ngOnInit() {
  }

  add() {
    if (this.form.name.length === 0) {
      this.alertService.error('Please fill proper company/person name'); return;
    }

    if (this.form.contactperson.length === 0) {
      this.alertService.error('Please fill proper contact name'); return;
    }

    if (this.form.state.length === 0) {
      this.alertService.error('Please select state'); return;
    }


    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.post('/?object=person&action=add', this.form);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.personService.$persons = this.personService.getAll();
        const models = this.dom.nativeElement.querySelectorAll('button[data-dismiss="modal"]');
        for (const x of models) {
          x.click();
        }
        this.alertService.success(res.msg);
      } else {
        this.alertService.error(res.msg);
      }
    });
  }


  editMe(x) {
    this.formEdit = x;
  }

  edit() {
    if (this.formEdit.name.length === 0) {
      this.alertService.error('Please fill proper company/person name'); return;
    }

    if (this.formEdit.contactperson.length === 0) {
      this.alertService.error('Please fill proper contact name'); return;
    }

    if (this.formEdit.state.length === 0) {
      this.alertService.error('Please select state'); return;
    }


    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.post('/?object=person&action=update', this.formEdit);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.personService.$persons = this.personService.getAll();
        const models = this.dom.nativeElement.querySelectorAll('button[data-dismiss="modal"]');
        for (const x of models) {
          x.click();
        }
        this.alertService.success(res.msg);
      } else {
        this.alertService.error(res.msg);
      }
    });
  }

  viewMe(x) {
    this.formView = x;
  }

  deleteMe(x) {
    this.formView = x;
  }

  delete() {
    if (this.formView.id === 0) {
      this.alertService.error('Invaild Product'); return;
    }

    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.update('/?object=person&action=delete', this.formView);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.personService.$persons = this.personService.getAll();
        const models = this.dom.nativeElement.querySelectorAll('button[data-dismiss="modal"]');
        for (const x of models) {
          x.click();
        }
        this.alertService.success(res.msg);
      } else {
        this.alertService.error(res.msg);
      }
    });
  }

}
