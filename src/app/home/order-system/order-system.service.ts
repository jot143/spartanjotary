import { Injectable } from '@angular/core';
import { ProductService } from '../products/product.service';
import { RestApiService } from 'src/core/services/rest-api.service';
import { map } from 'rxjs/operators';
import { UserService } from 'src/core/services';
import { PersonService } from '../persons/service/person.service';
import { InventoryService } from '../inventory/inventory.service';

@Injectable({
  providedIn: 'root'
})
export class OrderSystemService {
  subjects: any;
  $subjects: any;

  printObject: any = null;

  constructor(public productService: ProductService,
              public personService: PersonService,
              public inventoryService: InventoryService,
              public userService: UserService,
              public restapi: RestApiService) { }

  autocomplete(form, matches = [{key: 'name', typeof: 'string'}]) {
    console.log(form);
    form.searchList = [];
    if (form.typing === '') {
      return;
    }
    const compare = (x) => {
      for (const i of matches) {
        if (i.typeof === 'string') {
          if (x[i.key].toLowerCase().search(form.typing.toLowerCase()) > -1) {
            return true;
          }
        }
      }
      return false;
    };

    const search = (arry) => {
      const emptyAry = [];
      for (const x of arry) {
        if (compare(x)) {
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

  getDetailofAutoComplete(field, id, obj = {}) {
     console.log(field);
     const res = field.from.value.split('.');
     const serviceName = res[0];
     const serviceProperty = res[1];
     const service = this;

     const ary = service[serviceName][serviceProperty];
     for (const x of ary) {
       // tslint:disable-next-line:triple-equals
       if (x.id == id) {
        const key = field.key + '_detail';
        obj[key] = x;
        // const ret = field.callback(x, field);
        // tslint:disable-next-line:triple-equals
        // if (typeof ret == 'undefined') {
        return field.viewCallback(x);
        // }
        // return ret;
       }
     }
  }

  getNameOfAutoComplete(field, id, obj) {
    console.log(field);
    const res = field.from.value.split('.');
    const serviceName = res[0];
    const serviceProperty = res[1];
    const service = this;

    const ary = service[serviceName][serviceProperty];
    for (const x of ary) {
      // tslint:disable-next-line:triple-equals
      if (x.id == id) {
        const key = field.key + '_detail';
        obj[key] = x;
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

  stockOut(x) {
    return this.restapi.update('/?object=orderSystem&action=stockout', x);
  }

  delete(x) {
    return this.restapi.update('/?object=orderSystem&action=delete', x);
  }
}
