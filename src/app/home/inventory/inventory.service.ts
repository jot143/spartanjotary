import { Injectable } from '@angular/core';
import { AlertService, LoaderService } from 'src/core/components';
import { RestApiService } from 'src/core/services/rest-api.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AuthenticationService } from 'src/core/services';


@Injectable({
  providedIn: 'root'
})
export class InventoryService {

  $inventry: Observable<any>;
  inventry: any = [];

  warehouse = { id: 1};
  formEdit: any = {};

  constructor(public restapi: RestApiService, public alertService: AlertService,
              public authService: AuthenticationService, public loaderService: LoaderService) {
                this.$inventry = this.getAll();
  }

  getAll() {
    const response = this.restapi.get('/?object=inventory&action=getAll').pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.inventry = res.data;
        }
        return this.inventry;
      })
    );

    return response;
  }

  getQuantity(id) {
      return  new Observable((observer) => {
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

        observer.next(search(id, this.inventry));
        observer.complete();
      });
  }

  stockUpdate(product) {
    const response = this.restapi.update('/?object=inventory&action=stockupdate', product).pipe(
      map((res: any) => {
        if (res && res.status && res.status === 'success') {
          this.$inventry = this.getAll();
        }
        return res;
      }
    ));
    return response;
  }
}
