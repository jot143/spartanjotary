import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FormsModule } from '@angular/forms';

import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { NavbarComponent } from './navbar/navbar.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { CategoryComponent } from './category/category.component';
import { TreeViewComponent } from './category/tree-view/tree-view.component';
import { DropdownTreeComponent } from './category/dropdown-tree/dropdown-tree.component';

@NgModule({
  declarations: [HomeComponent, NavbarComponent,
    SidebarComponent, DashboardComponent, CategoryComponent, TreeViewComponent, DropdownTreeComponent],
  imports: [
    CommonModule,
    HomeRoutingModule,
    FormsModule
  ]
})
export class HomeModule { }
