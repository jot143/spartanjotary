import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Currency2wordsPipe } from './currency2words.pipe';

@NgModule({
  declarations: [Currency2wordsPipe],
  imports: [
    CommonModule
  ]
})
export class PipeModule { }
