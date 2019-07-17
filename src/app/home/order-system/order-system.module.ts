import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { OrderSystemRoutingModule } from './order-system-routing.module';
import { OrderSystemComponent } from './order-system.component';
import { FormsModule } from '@angular/forms';

import { OrderModule } from 'ngx-order-pipe';
import { FormBuilderComponent } from './form-builder/form-builder.component';
import { ListComponent } from './list/list.component';
import { AddComponent } from './add/add.component';

@NgModule({
  declarations: [OrderSystemComponent, FormBuilderComponent, ListComponent, AddComponent],
  imports: [
    CommonModule,
    OrderSystemRoutingModule,
    FormsModule, OrderModule
  ]
})
export class OrderSystemModule { }
