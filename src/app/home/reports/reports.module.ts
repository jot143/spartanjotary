import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReportsRoutingModule } from './reports-routing.module';
import { ReportsComponent } from '../reports/reports.component';
import { SaleReportComponent } from './sale-report/sale-report.component';
import { CompareSaleComponent } from './compare-sale/compare-sale.component';
import { CompiledSaleComponent } from './compiled-sale/compiled-sale.component';

@NgModule({
  declarations: [ReportsComponent, SaleReportComponent, CompareSaleComponent, CompiledSaleComponent],
  imports: [
    CommonModule,
    ReportsRoutingModule
  ],
})
export class ReportsModule { }
