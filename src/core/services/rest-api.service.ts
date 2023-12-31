import { AlertService, LoaderService } from '../components';
import { catchError, map } from 'rxjs/operators';

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RestApiService {

  apiUrl = 'http://jobtory.pu';
  //  apiUrl = 'http://spartan.rcubinity.com/api';
  // apiUrl = 'http://luca.rcubinity.com/api';
  constructor(private http: HttpClient,
              public alertService: AlertService,
              public loaderService: LoaderService) { }

  get(endpoint: string) {
      return this.http.get(`${this.apiUrl}${endpoint}`).pipe(
        map((response) => {
          console.log(response);
          return response;
        }),
        catchError((e: any) => {
          console.log(e);
          this.loaderService.dismiss();
          this.alertService.error('Internet or technical error. Error:' + e.name);
          return throwError(e);
        }),
      );
  }

  post(endpoint: string, data: any) {
      return this.http.post(`${this.apiUrl}${endpoint}`, data).pipe(
        map((response) => {
          console.log(response);
          return response;
        }),
        catchError((e: any) => {
          console.log(e);
          this.loaderService.dismiss();
          this.alertService.error('Internet or technical error. Error:' + e.name);
          return throwError(e);
        }),
      );
  }

  update(endpoint: string, data: any) {
      return this.http.put(`${this.apiUrl}${endpoint}`, data).pipe(
        map((response) => {
          console.log(response);
          return response;
        }),
        catchError((e: any) => {
          console.log(e);
          this.loaderService.dismiss();
          this.alertService.error('Internet or technical error. Error:' + e.name);
          return throwError(e);
        }),
      );
  }

  delete(endpoint: string, data: any) {
      return this.http.delete(`${this.apiUrl}${endpoint}`, data).pipe(
        map((response) => {
          console.log(response);
          return response;
        }),
        catchError((e: any) => {
          console.log(e);
          this.loaderService.dismiss();
          this.alertService.error('Internet or technical error. Error:' + e.name);
          return throwError(e);
        }),
      );
  }
}
