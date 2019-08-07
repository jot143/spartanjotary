﻿import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { User } from '../models';
import { RestApiService } from './rest-api.service';

@Injectable({ providedIn: 'root' })
export class AuthenticationService {
    apiUrl = '';
    public currentUserSubject: BehaviorSubject<User>;
    public currentUser: Observable<User>;

    constructor(private restapi: RestApiService) {
        this.currentUserSubject = new BehaviorSubject<User>(JSON.parse(localStorage.getItem('currentUser')));
        this.currentUser = this.currentUserSubject.asObservable();
    }

    public get currentUserValue(): User {
        return this.currentUserSubject.value;
    }

    login(user: { email: string, password: string}) {
        const response = this.restapi.post('/?object=user&action=login', user);
        response.subscribe( (res: any) => {
          if (res && res.status && res.status === 'success') {
                   localStorage.setItem('currentUser', JSON.stringify(res.data));
                   this.currentUserSubject.next(res.data);
          }
        });
        return response;
    }

    // login(username: string, password: string) {
    //     return this.http.post<any>(`${this.apiUrl}/users/authenticate`, { username, password })
    //         .pipe(map(user => {
    //             // login successful if there's a jwt token in the response
    //             if (user && user.token) {
    //                 // store user details and jwt token in local storage to keep user logged in between page refreshes
    //                 localStorage.setItem('currentUser', JSON.stringify(user));
    //                 this.currentUserSubject.next(user);
    //             }

    //             return user;
    //         }));
    // }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');
        this.currentUserSubject.next(null);
    }
}
