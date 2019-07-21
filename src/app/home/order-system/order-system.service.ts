import { Injectable } from '@angular/core';
import { ProductService } from '../products/product.service';
import { SubjectService } from '../persons/service/subject.service';
import { RestApiService } from 'src/core/services/rest-api.service';
import { map } from 'rxjs/operators';
import { UserService } from 'src/core/services';

@Injectable({
  providedIn: 'root'
})
export class OrderSystemService {
  subjects: any;
  $subjects: any;

  constructor(public productService: ProductService,
              public subjectService: SubjectService,
              public userService: UserService,
              public restapi: RestApiService) { }

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

  getNameOfAutoComplete(field, id) {
    const res = field.from.value.split('.');
    const serviceName = res[0];
    const serviceProperty = res[1];
    const service = this;

    const ary = service[serviceName][serviceProperty];
    for (const x of ary) {
      // tslint:disable-next-line:triple-equals
      if (x.id == id) {
        return x.name;
      }
    }
  }

  add(parameter, schema) {
    const response = this.restapi.post('/?object=orderSystem&action=add', parameter);
    return response;
  }

  getAll(object, schema) {
    const response = this.restapi.get('/?object=orderSystem&action=getAll&schema=' + schema.object).pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          object = res.data;
        }
        return object;
      })
    );

    return response;
  }

  getItems(object, schema) {
    this.restapi.get('/?object=orderSystem&action=getItems&schema='
    + schema.object + '&id=' + object.id ).subscribe((res: any) => {
      // tslint:disable-next-line:triple-equals
      if (res.status == 'success') {
        object.items = res.data;
      } else {
        object.items = [];
      }
    });
  }

  stockIn(x) {
    return this.restapi.update('/?object=orderSystem&action=stockin', x);
  }
}
