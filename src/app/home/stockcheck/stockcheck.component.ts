import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { RestApiService } from 'src/core/services/rest-api.service';
import { map } from 'rxjs/operators';
import { ProductService } from '../products/product.service';
import { InventoryService } from '../inventory/inventory.service';

declare var $: any;
@Component({
  selector: 'app-stockcheck',
  templateUrl: './stockcheck.component.html',
  styleUrls: ['./stockcheck.component.scss']
})
export class StockcheckComponent implements OnInit {
  orders = [];
  $orders: Observable<any>;

  constructor(
              public restapi: RestApiService,
              public productService: ProductService,
              public inventoryService: InventoryService) {
              this.$orders = this.allOrdersItems();
  }

  ngOnInit() {
  }


  allOrdersItems() {
    const response = this.restapi.get('/?object=stockCheck&action=allOrdersItems').pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.orders = res.data;
        }
        return this.orders;
      })
    );

    return response;
  }

  getQuantity(id, x) {
    return this.inventoryService.getQuantity(id).pipe(
      map((res: any) => {
        x.available_qty = res;
        x.needQty = x.qty - x.available_qty;
        return res;
      }));
  }

  getNameOfProduct(id) {
    // console.log("name", field, id);
    for (const x of this.productService.products) {
      // tslint:disable-next-line:triple-equals
      if (x.id == id) {
        return x.name;
      }
    }
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
      if (td1) {
        const txtValue = td1.textContent || td1.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = '';
        } else {
          tr[i].style.display = 'none';
        }
      }

      const td2 = tr[i].getElementsByTagName('td')[2];
      if (td2) {
        const txtValue = td2.textContent || td2.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = '';
        } else {
          tr[i].style.display = 'none';
        }
      }
    }
  }
}
