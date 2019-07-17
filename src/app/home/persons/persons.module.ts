import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PersonsRoutingModule } from './persons-routing.module';
import { PersonsComponent } from './persons/persons.component';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [PersonsComponent],
  imports: [
    CommonModule,
    PersonsRoutingModule,
    FormsModule,
  ]
})
export class PersonsModule { }
