import { Injectable } from '@angular/core';
import { ProductService } from '../products/product.service';
import { SubjectService } from '../persons/service/subject.service';

@Injectable({
  providedIn: 'root'
})
export class OrderSystemService {

  constructor(public productService: ProductService, public subjectService: SubjectService) { }

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
}
