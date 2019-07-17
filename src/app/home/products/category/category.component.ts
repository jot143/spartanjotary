import { Component, OnInit, ViewEncapsulation, ElementRef } from '@angular/core';
import { ProductService } from 'src/app/home/products/product.service';
import { AlertService, LoaderService } from 'src/core/components';
import { RestApiService } from 'src/core/services/rest-api.service';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class CategoryComponent implements OnInit {

  cat = {
    parent_id: 0,
    name: ''
  };

  editCat: any = { name: '' };
  viewCat: any = {};

  parentsearch = '';
  parentsearchList = [];
  selectedParent: any = { id: 0, name: 'No Parent', parent_id: 0 };

  callback = {

    action: (x) => {
      this.parentsearchList = [];
      this.parentsearch = x.name;
      this.cat.parent_id = x.id;
      this.selectedParent = x;
    },
    edit: (x) => {
      this.editCat = Object.assign({}, x);
      this.selectedParent = this.searchCatById(x.parent_id);
      this.parentsearch = this.selectedParent.name;
    },
    delete: (x: any) => {
      this.viewCat = Object.assign({}, x);
      this.selectedParent = this.searchCatById(x.parent_id);
      if (this.selectedParent === false) {
        this.selectedParent = {name: 'No Parent'};
      }
    }
  };
  constructor(
    private dom: ElementRef,
    public alertService: AlertService,
    public productService: ProductService,
    public loaderService: LoaderService,
    private restapi: RestApiService) { }

  ngOnInit() {
    // console.log(this.productService);
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

  searchCatById(id: number) {
    const search = (arry, n: number) => {
      for (const x of arry) {
        if (x.id === n) {
          return x;
        } else {
          if (x.children && x.children.length > 0) {
            const childAry = search(x.children, n);
            if (childAry !== false) {
              return childAry;
            }
          }
        }
      }
      return false;
    };
    return search(this.productService.categories, id);
  }


  add() {
    if (this.cat.name.length === 0) {
      this.alertService.error('Please fill proper category name'); return;
    }

    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.post('/?object=product&action=addCategory', this.cat);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        if (this.selectedParent.id !== 0) {
          // tslint:disable-next-line:triple-equals
          if (typeof this.selectedParent.children == 'undefined') {
            this.selectedParent.children = [];
          }
          this.selectedParent.children.push({ id: res.data, name: this.cat.name, parent_id: this.cat.parent_id });
        } else {
          this.productService.categories.push({ id: res.data, name: this.cat.name, parent_id: this.cat.parent_id });
        }

        this.cat = {
          parent_id: 0,
          name: ''
        };

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

  edit() {
    console.log(this.selectedParent);

    // tslint:disable-next-line:triple-equals
    if (this.selectedParent == false) {
      this.selectedParent = { id: 0, name: 'No Parent', parent_id: 0 };
    }

    if (this.editCat.name.length === 0) {
      this.alertService.error('Please fill proper category name'); return;
    }

    if (this.selectedParent.id === this.editCat.id) {
      this.alertService.error('Category never have parent of itself'); return;
    }

    ////////////////////////////////////
    // Seacrh in child /////////////////
    ////////////////////////////////////
    let isChildren = 0;
    const searchInChildren = (ary: any) => {
      for (const x of ary) {
        // tslint:disable-next-line:triple-equals
        if (this.selectedParent.id == x.id) {
          isChildren = 1;
        }

        if (x.children) {
          searchInChildren(x.children);
        }
      }
    };


    if (this.editCat.children) {
      searchInChildren(this.editCat.children);
      // if (isChildren === 1) {
      //   this.alertService.error('Category never have parent of its children'); return;
      // }
    }

    let parameter: any = {};
    if (isChildren === 1) {
      parameter = [
        { id: this.selectedParent.id, parent_id: this.editCat.parent_id, name: this.selectedParent.name },
        { id: this.editCat.id, parent_id: this.selectedParent.id, name: this.editCat.name }];
    } else {
      parameter = [
        { id: this.editCat.id, parent_id: this.selectedParent.id, name: this.editCat.name }];
    }

    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.update('/?object=product&action=updateCategories', parameter);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.productService.categories = this.productService.getNestedChildren(res.data, 0);

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


  delete(cat) {
    console.log(cat);
    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.update('/?object=product&action=deleteCategories', cat);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        this.productService.categories = this.productService.getNestedChildren(res.data, 0);

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
