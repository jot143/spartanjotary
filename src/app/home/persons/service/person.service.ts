import { Injectable } from '@angular/core';

import { RestApiService } from 'src/core/services/rest-api.service';
import { AlertService } from 'src/core/components';
import { map, catchError } from 'rxjs/operators';
import { Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PersonService {
  persons = [];
  $persons: Observable<any>;

  viewproduct: any = {};
  editproduct: any = {};
  deleteproduct: any = {};

  constructor(public restapi: RestApiService,
              public alertService: AlertService) {
    // this.$categoriesLinear = this.getCategories();
    this.$persons = this.getAll();
  }

  getNestedChildren(arr, parentId) {
    const out = [];
    for (const i in arr) {
      // tslint:disable-next-line:triple-equals
      if (arr[i].parent_id == parentId) {
        const children = this.getNestedChildren(arr, arr[i].id);
        if (children.length) {
          arr[i].children = children;
        }
        out.push(arr[i]);
      }
    }
    return out;
  }


  getAll() {
    const response = this.restapi.get('/?object=person&action=getAll').pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.persons = res.data;
        }
        return this.persons;
      })
    );

    return response;
  }
}
