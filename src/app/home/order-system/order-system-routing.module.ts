import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OrderSystemComponent } from './order-system.component';
import { ChallaninSchema } from './data/ChallanIn.Schema';
import { Challanin } from './data/ChallanIn.subject';
import { ListComponent } from './list/list.component';
import { AddComponent } from './add/add.component';

const routes: Routes = [
  { path: '', redirectTo: 'challanin', pathMatch: 'full'},
  { path: 'challanin', component: OrderSystemComponent,
    data: {schema: ChallaninSchema, object: Challanin},
    children: [
      { path: '', redirectTo: 'list', pathMatch: 'full'},
      { path: 'list', component: ListComponent, data: {schema: ChallaninSchema, object: Challanin}},
      { path: 'add', component: AddComponent, data: {schema: ChallaninSchema, object: Challanin}, }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class OrderSystemRoutingModule { }
