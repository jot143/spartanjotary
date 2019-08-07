import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OrderSystemComponent } from './order-system.component';

import { ChallaninSchema } from './data/ChallanIn.Schema';
import { Challanin } from './data/ChallanIn.subject';
import { ChallanoutSchema } from './data/Challanout.schema';
import { Challanout } from './data/Challanout.subject';
import { SaleSchema } from './data/Sale.schema';
import { Sale } from './data/Sale.subject';
import { PurchaseSchema } from './data/Purchase.schema';
import { Purchase } from './data/Purchase.subject';


import { ListComponent } from './list/list.component';
import { AddComponent } from './add/add.component';
import { Damage } from './data/Damage.subject';
import { DamageSchema } from './data/Damage.schema';
import { DummyOrderSchema } from './data/DummyOrder.schema';
import { DummyOrder } from './data/DummyOrder.subject ';
import { PrintPurchaseComponent } from './print-purchase/print-purchase.component';
import { PrintSaleComponent } from './print-sale/print-sale.component';
import { PrintChallanoutComponent } from './print-challanout/print-challanout.component';
import { PrintChallaninComponent } from './print-challanin/print-challanin.component';
import { PrintPackingslipComponent } from './print-packingslip/print-packingslip.component';
import { PrintDamageComponent } from './print-damage/print-damage.component';

const routes: Routes = [
  { path: '', redirectTo: 'challanin', pathMatch: 'full'},
  { path: 'challanin', component: OrderSystemComponent,
    data: {schema: ChallaninSchema, object: Challanin},
    children: [
      { path: '', redirectTo: 'list', pathMatch: 'full'},
      { path: 'list', component: ListComponent, data: {schema: ChallaninSchema, object: Challanin}},
      { path: 'add', component: AddComponent, data: {schema: ChallaninSchema, object: Challanin}},
      { path: 'print', component: PrintChallaninComponent, data: {schema: ChallaninSchema}},
    ]
  },
  { path: 'challanout', component: OrderSystemComponent,
    data: {schema: ChallanoutSchema, object: Challanout},
    children: [
      { path: '', redirectTo: 'list', pathMatch: 'full'},
      { path: 'list', component: ListComponent, data: {schema: ChallanoutSchema, object: Challanout}},
      { path: 'add', component: AddComponent, data: {schema: ChallanoutSchema, object: Challanout}},
      { path: 'print', component: PrintChallanoutComponent, data: {schema: ChallanoutSchema}},
    ]
  },
  { path: 'sale', component: OrderSystemComponent,
    data: {schema: SaleSchema, object: Sale},
    children: [
      { path: '', redirectTo: 'list', pathMatch: 'full'},
      { path: 'list', component: ListComponent, data: {schema: SaleSchema, object: Sale}},
      { path: 'add', component: AddComponent, data: {schema: SaleSchema, object: Sale}},
      { path: 'print', component: PrintSaleComponent, data: {schema: SaleSchema}},
      { path: 'print-packing', component: PrintPackingslipComponent, data: {schema: SaleSchema}},
    ]
  },
  { path: 'purchase', component: OrderSystemComponent,
    data: {schema: PurchaseSchema, object: Purchase},
    children: [
      { path: '', redirectTo: 'list', pathMatch: 'full'},
      { path: 'list', component: ListComponent, data: {schema: PurchaseSchema, object: Purchase}},
      { path: 'add', component: AddComponent, data: {schema: PurchaseSchema, object: Purchase}},
      { path: 'print', component: PrintPurchaseComponent, data: {schema: PurchaseSchema}},
    ]
  },
  { path: 'damage', component: OrderSystemComponent,
    data: {schema: DamageSchema, object: Damage},
    children: [
      { path: '', redirectTo: 'list', pathMatch: 'full'},
      { path: 'list', component: ListComponent, data: {schema: DamageSchema, object: Damage}},
      { path: 'add', component: AddComponent, data: {schema: DamageSchema, object: Damage}},
      { path: 'print', component: PrintDamageComponent, data: {schema: DamageSchema}},
    ]
  },
  { path: 'dummyorder', component: OrderSystemComponent,
    data: {schema: DummyOrderSchema, object: DummyOrder},
    children: [
      { path: '', redirectTo: 'list', pathMatch: 'full'},
      { path: 'list', component: ListComponent, data: {schema: DummyOrderSchema, object: DummyOrder}},
      { path: 'add', component: AddComponent, data: {schema: DummyOrderSchema, object: DummyOrder}}
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class OrderSystemRoutingModule { }
