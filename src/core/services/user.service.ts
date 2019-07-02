import { Injectable } from '@angular/core';

import { User } from '../models';
import { RestApiService } from './rest-api.service';

@Injectable({ providedIn: 'root' })
export class UserService {
    apiUrl = '';
    constructor(public restapi: RestApiService) { }

    register(user: any) {

    }

    getById(id: number) {
        return this.restapi.get(`/user/${id}`);
    }

}
