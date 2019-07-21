import { Injectable } from '@angular/core';

import { RestApiService } from 'src/core/services/rest-api.service';
import { AlertService } from 'src/core/components';
import { map, catchError } from 'rxjs/operators';
import { Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SubjectService {
  categories = [];
  $categories: Observable<any>;
  subjects = [];
  $subjects: Observable<any>;
  categoriesLinear = [];
  $categoriesLinear: Observable<any>;

  viewproduct: any = {};
  editproduct: any = {};
  deleteproduct: any = {};

  constructor(public restapi: RestApiService,
              public alertService: AlertService) {
    // this.$categoriesLinear = this.getCategories();
    this.$subjects = this.getAll();
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

  getTree(id) {
    return  new Observable((observer) => {
      // tslint:disable-next-line:variable-name
      const getParent = (_id: any, _arr: any) => {

        for (const x of _arr) {
          if (x.id === _id) {
            // tslint:disable-next-line:triple-equals
            if (x.parent_id == 0) {
              return x.name;
            } else {
              return getParent(x.parent_id, _arr)  + ' > ' +  x.name;
            }
          }
        }
        return '';
      };

      observer.next(getParent(id, this.categoriesLinear));
      observer.complete();
    });
  }

  getCategories() {
    const response = this.restapi.get('/?object=person&action=getAllCategories');
    response.subscribe((res: any) => {
      if (res && res.status && res.status === 'success') {
        this.categoriesLinear = res.data;
        this.categories = this.getNestedChildren(res.data, 0);
      }
    });
    return response;
  }

  getAll() {
    const response = this.restapi.get('/?object=person&action=getAll').pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.subjects = res.data;
        }
        return this.subjects;
      })
    );

    return response;
  }
}
