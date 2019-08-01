import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import {AlertComponent, LoaderComponent} from '../core/components';
import { ProductsModule } from './home/products/products.module';
import { FormsModule } from '@angular/forms';
import { PersonsModule } from './home/persons/persons.module';
import { InventoryModule } from './home/inventory/inventory.module';
import { PrintPurchaseComponent } from './print-purchase/print-purchase.component';



@NgModule({
  declarations: [
    AppComponent,
    AlertComponent,
    LoaderComponent,
    PrintPurchaseComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    PersonsModule,
    FormsModule,
    HttpClientModule,
    ProductsModule,
    InventoryModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
