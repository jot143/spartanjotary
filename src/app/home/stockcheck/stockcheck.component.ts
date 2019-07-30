import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { RestApiService } from 'src/core/services/rest-api.service';
import { map } from 'rxjs/operators';
import { ProductService } from '../products/product.service';
import { InventoryService } from '../inventory/inventory.service';

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
}
