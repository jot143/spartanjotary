import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { OrderSystemRoutingModule } from './order-system-routing.module';
import { OrderSystemComponent } from './order-system.component';
import { FormsModule } from '@angular/forms';

import { OrderModule } from 'ngx-order-pipe';
import { FormBuilderComponent } from './form-builder/form-builder.component';
import { ListComponent } from './list/list.component';
import { AddComponent } from './add/add.component';
import { PrintPurchaseComponent } from './print-purchase/print-purchase.component';
import { PipeModule } from 'src/app/pipe/pipe.module';
import { PrintPackingslipComponent } from './print-packingslip/print-packingslip.component';
import { PrintChallaninComponent } from './print-challanin/print-challanin.component';
import { PrintChallanoutComponent } from './print-challanout/print-challanout.component';
import { PrintSaleComponent } from './print-sale/print-sale.component';

@NgModule({
  declarations: [
    OrderSystemComponent,
    FormBuilderComponent,
    ListComponent,
    AddComponent,
    PrintPurchaseComponent,
    PrintPackingslipComponent,
    PrintChallaninComponent,
    PrintChallanoutComponent,
    PrintSaleComponent
  ],
  imports: [
    CommonModule,
    OrderSystemRoutingModule,
    FormsModule, OrderModule,
    PipeModule
  ]
})
export class OrderSystemModule { }
