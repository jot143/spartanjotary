import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map, catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { AlertService } from '../components';

@Injectable({
  providedIn: 'root'
})
export class RestApiService {

  apiUrl = 'http://localhost/repo/jobtoryapi';
  constructor(private http: HttpClient, public alertService: AlertService) { }

  get(endpoint: string) {
      return this.http.get(`${this.apiUrl}${endpoint}`).pipe(
        map((response) => {
          console.log(response);
          return response;
        }),
        catchError((e: any) => {
          console.log(e);
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
          this.alertService.error('Internet or technical error. Error:' + e.name);
          return throwError(e);
        }),
      );
  }

  delete(endpoint: string) {
      return this.http.get(`${this.apiUrl}/${endpoint}`).pipe(
        map((response) => {
          console.log(response);
          return response;
        }),
        catchError((e: any) => {
          console.log(e);
          this.alertService.error('Internet or technical error. Error:' + e.name);
          return throwError(e);
        }),
      );
  }
}
