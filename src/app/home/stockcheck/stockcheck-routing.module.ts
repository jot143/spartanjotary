import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StockcheckComponent } from './stockcheck.component';

const routes: Routes = [{
  path: '',
  component: StockcheckComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StockcheckRoutingModule { }
