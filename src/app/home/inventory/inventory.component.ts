import { Component, OnInit, ElementRef } from '@angular/core';
import { AlertService, LoaderService } from 'src/core/components';
import { ProductService } from '../products/product.service';
import { RestApiService } from 'src/core/services/rest-api.service';
import { InventoryService } from './inventory.service';

@Component({
  selector: 'app-inventory',
  templateUrl: './inventory.component.html',
  styleUrls: ['./inventory.component.scss']
})
export class InventoryComponent implements OnInit {

  constructor(private dom: ElementRef,
              public alertService: AlertService,
              public productService: ProductService,
              public loaderService: LoaderService,
              public restapi: RestApiService,
              public inventoryService: InventoryService) { }

  ngOnInit() {
  }

  stockUpdate(product) {

    // tslint:disable-next-line:variable-name
    const search = (_id: any, _arr: any) => {
      for (const x of _arr) {
        if (x.product_id === _id) {
          // tslint:disable-next-line:triple-equals
          return x.total_quantity;
        }
      }
      return 0;
    };

    const user = JSON.parse(localStorage.getItem('currentUser'));
    const oldQty = search(product.id, this.inventoryService.inventry);
    // tslint:disable-next-line: variable-name
    const change_in_quantity = product.new_quantity - oldQty;

    if (change_in_quantity === 0) {
      this.alertService.error('Please Change Quantity');
      return;
    }
    const formData = {
      warehouse_id: this.inventoryService.warehouse.id,
      product_id: product.id,
      product_sku: product.sku,
      meta_key: 'stock_correction_by_user',
      meta_value: user.id,
      total_quantity: product.new_quantity,
      change_in_quantity
    };


    this.loaderService.start('Please Wait...', true);

    this.inventoryService.stockUpdate(formData).subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        const models = this.dom.nativeElement.querySelectorAll('button[data-dismiss="modal"]');
        for (const x of models) {
          x.click();
        }
        this.alertService.success(res.msg);
      } else {
        this.alertService.error(res.msg);
      }
    });
  }

}
