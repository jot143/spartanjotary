import { Component, OnInit, ElementRef } from '@angular/core';
import { AlertService, LoaderService } from 'src/core/components';
import { ProductService } from '../products/product.service';
import { RestApiService } from 'src/core/services/rest-api.service';
import { InventoryService } from './inventory.service';

declare var $: any;

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

  exportExcel() {
    $('#myTable').tableExport({formats: ['xls', 'csv', 'txt']} );
    $('.button-default.csv').click();
  }

  search() {
    // Declare variables
    const input = $('#search')[0];
    const filter = input.value.toUpperCase();
    const table = $('#myTable')[0];
    const tr = table.getElementsByTagName('tr');

    // Loop through all table rows, and hide those who don't match the search query
    // tslint:disable-next-line:prefer-for-of
    for (let i = 0; i < tr.length; i++) {
      const td1 = tr[i].getElementsByTagName('td')[1];
      const td2 = tr[i].getElementsByTagName('td')[2];
      if (td1 && td2) {
        const txtValue1 = td1.textContent || td1.innerText;
        const txtValue2 = td2.textContent || td2.innerText;
        if (txtValue1.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = '';
        } else {
          tr[i].style.display = 'none';
        }
      }
    }
  }

}
