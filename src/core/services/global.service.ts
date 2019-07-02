import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class GlobalService {

  skipwelcome = false;

  constructor() { }

  set(key, value) {
    this[key] = value;

    try {
      return JSON.parse(localStorage.setitem(key, value));
    } catch (e) { return localStorage.setItem(key, JSON.stringify(value)); }
  }

  get(key) {
    const data = localStorage.getItem(key);
    try {
      return JSON.parse(localStorage.getItem(key));
    } catch (e) { return data; }
  }
}
