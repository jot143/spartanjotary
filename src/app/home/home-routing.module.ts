import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home.component';
import { DashboardComponent } from './dashboard/dashboard.component';

const routes: Routes = [
  {
    path: '',
    component: HomeComponent,
    children: [
      { path: '', component: DashboardComponent},
      { path: 'products', loadChildren: './products/products.module#ProductsModule'},
      { path: 'persons', loadChildren: './persons/persons.module#PersonsModule'},
      { path: 'inventory', loadChildren: './inventory/inventory.module#InventoryModule'},
      { path: 'stockcheck', loadChildren: './stockcheck/stockcheck.module#StockcheckModule'},
      { path: 'order-system', loadChildren: './order-system/order-system.module#OrderSystemModule'}
    ]
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule { }
