import { Component, OnInit, ElementRef } from '@angular/core';
import { AlertService, LoaderService } from 'src/core/components';
import { ProductService } from 'src/app/service/product.service';
import { RestApiService } from 'src/core/services/rest-api.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.scss']
})
export class ProductsComponent implements OnInit {
  parentsearch = '';
  parentsearchList = [];
  selectedParent: any = { id: 0, name: 'No Parent', parent_id: 0 };

  viewproduct: any = {};
  editproduct: any = {};
  deleteproduct: any = {};
  newproduct = {
    category_id: 0,
    sku: '',
    name: '',
    description: '',
    quantityin: '',
    ean: '',
    color: '',
    size: '',
    hsn: '',
    gstpercentage: 0,
    dealprice: 0,
    mrp: 0
  };
  callback = {
    action: (x) => {
      this.parentsearchList = [];
      this.parentsearch = x.name;
      this.newproduct.category_id = x.id;
      this.selectedParent = x;
    },
  };
  constructor(private dom: ElementRef,
              public alertService: AlertService,
              public productService: ProductService,
              public loaderService: LoaderService,
              public restapi: RestApiService) { }

  ngOnInit() {
  }

  autocomplete() {
    this.parentsearchList = [{ id: 0, name: 'No Parent', parent_id: 0 }];
    if (this.parentsearch === '') {
      return;
    }
    const search = (arry) => {
      const emptyAry = [];
      for (const x of arry) {
        if (x.name.toLowerCase().search(this.parentsearch.toLowerCase()) > -1) {
          emptyAry.push(x);
        } else {
          if (x.children && x.children.length > 0) {
            const childAry = search(x.children);
            if (childAry.length > 0) {
              for (const i of childAry) {
                emptyAry.push(i);
              }
            }
          }
        }
      }

      return emptyAry;
    };

    this.parentsearchList = search(this.productService.categories);
  }

  add() {
    if (this.newproduct.name.length === 0) {
      this.alertService.error('Please fill proper name'); return;
    }

    if (this.newproduct.sku.length === 0) {
      this.alertService.error('Please fill proper Code/Sku'); return;
    }

    this.newproduct.mrp = Number(this.newproduct.mrp);
    this.newproduct.dealprice = Number(this.newproduct.dealprice);


    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.post('/?object=product&action=add', this.newproduct);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.productService.$products = this.productService.getProducts();
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

  editMe(x) {
    this.editproduct = x;
  }

  edit() {
    if (this.editproduct.name.length === 0) {
      this.alertService.error('Please fill proper name'); return;
    }

    if (this.editproduct.sku.length === 0) {
      this.alertService.error('Please fill proper Code/Sku'); return;
    }

    this.editproduct.mrp = Number(this.editproduct.mrp);
    this.editproduct.dealprice = Number(this.editproduct.dealprice);


    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.update('/?object=product&action=update', this.editproduct);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.productService.$products = this.productService.getProducts();
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

  viewMe(x) {
    this.viewproduct = x;
  }

  deleteMe(x) {
    this.viewproduct = x;
  }

  delete() {
    if (this.viewproduct.id === 0) {
      this.alertService.error('Invaild Product'); return;
    }

    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.update('/?object=product&action=delete', this.viewproduct);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.productService.$products = this.productService.getProducts();
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
