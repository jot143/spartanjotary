import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ReportsComponent } from './reports.component';
import { SaleReportComponent } from './sale-report/sale-report.component';
import { CompareSaleComponent } from './compare-sale/compare-sale.component';
import { CompiledSaleComponent } from './compiled-sale/compiled-sale.component';


const routes: Routes = [
  {
    path: '',
    component: ReportsComponent,
    children: [
      { path: '', redirectTo: 'sale-report', pathMatch: 'full'},
      { path: 'sale-report', component: SaleReportComponent },
      { path: 'compare-sale', component: CompareSaleComponent },
      { path: 'compiled-sale', component: CompiledSaleComponent },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReportsRoutingModule { }
