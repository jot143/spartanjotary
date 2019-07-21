import { Injectable } from '@angular/core';

import { User } from '../models';
import { RestApiService } from './rest-api.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class UserService {
    apiUrl = '';
    subjects = [];
    $subjects: Observable<any>;

    constructor(public restapi: RestApiService) {
      this.$subjects = this.getAll();
      this.$subjects.subscribe();
    }

    register(user: any) {

    }

    cId() {
      const c: any = JSON.parse(localStorage.getItem('currentUser'));
      return c.id;
    }


    getAll() {
      const response = this.restapi.get('/?object=user&action=getAll').pipe(
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
