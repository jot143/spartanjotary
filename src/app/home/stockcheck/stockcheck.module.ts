import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StockcheckRoutingModule } from './stockcheck-routing.module';
import { StockcheckComponent } from './stockcheck.component';

@NgModule({
  declarations: [StockcheckComponent],
  imports: [
    CommonModule,
    StockcheckRoutingModule
  ]
})
export class StockcheckModule { }
