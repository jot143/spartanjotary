import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductsRoutingModule } from './products-routing.module';
import { ProductsComponent } from './products/products.component';
import { CategoryComponent } from './category/category.component';
import { TreeViewComponent } from './category/tree-view/tree-view.component';
import { DropdownTreeComponent } from './category/dropdown-tree/dropdown-tree.component';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [ProductsComponent, CategoryComponent, TreeViewComponent, DropdownTreeComponent],
  imports: [
    CommonModule,
    ProductsRoutingModule,
    FormsModule,
  ]
})
export class ProductsModule { }
