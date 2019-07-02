import { Injectable, OnInit } from '@angular/core';
import { RestApiService } from 'src/core/services/rest-api.service';
import { async, Promise } from 'q';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  categories = [];

  constructor(public restapi: RestApiService) {
    this.getCategories();
  }

  getCategories() {
    const getNestedChildren = (arr, parentId) => {
      const out = [];
      for (const i in arr) {
        // tslint:disable-next-line:triple-equals
        if (arr[i].parent_id == parentId) {
          const children = getNestedChildren(arr, arr[i].id);
          if (children.length) {
            arr[i].children = children;
          }
          out.push(arr[i]);
        }
      }
      return out;
    };

    const response = this.restapi.get('/?object=product&action=getAllCategories');
    response.subscribe((res: any) => {
      if (res && res.status && res.status === 'success') {
        this.categories = getNestedChildren(res.data, 0);
      }
    });
  }
}
