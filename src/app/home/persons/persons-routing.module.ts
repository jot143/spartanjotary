import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PersonsComponent } from './persons/persons.component';

const routes: Routes = [
  {
    path: '',
    component: PersonsComponent,
  },
  // {
  //   path: 'categories',
  //   component: CategoryComponent,
  // }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PersonsRoutingModule { }
