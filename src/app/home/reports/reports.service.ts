import { Injectable } from '@angular/core';
import { RestApiService } from 'src/core/services/rest-api.service';
import { ProductService } from '../products/product.service';
import { PersonService } from '../persons/service/person.service';
import { InventoryService } from '../inventory/inventory.service';
import { UserService } from 'src/core/services';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ReportsService {
  saleReport: any = [];
  $saleReport: any;
  compiledSale: any = [];
  $compiledSale: any;
  compareSale: any = [];
  $compareSale: any;
  constructor(public productService: ProductService,
              public personService: PersonService,
              public inventoryService: InventoryService,
              public userService: UserService,
              public restapi: RestApiService) {
    this.$saleReport = this.getSaleReport();
    this.$compiledSale = this.getCompileSaleReport();
    this.$compareSale = this.getCompareSaleReport();
  }

  getSaleReport(data = null) {
    if (data == null) {
      data = '';
    }
    const response = this.restapi.get('/?object=reports&action=salereport' + data).pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.saleReport = res.data;
          console.log(this.saleReport);
        }
        return this.saleReport;
      })
    );
    return response;
  }


  getCompileSaleReport(data = null) {
    if (data == null) {
      data = '';
    }
    const response = this.restapi.get('/?object=reports&action=compilesalereport' + data).pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.compiledSale = res.data;
          console.log(this.compiledSale);
        }
        return this.compiledSale;
      })
    );
    return response;
  }

  getCompareSaleReport(data = null) {
    if (data == null) {
      data = '';
    }
    const response = this.restapi.get('/?object=reports&action=comparesalereport' + data).pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.compareSale = res.data;
        }
        return this.compareSale;
      })
    );
    return response;
  }
}
