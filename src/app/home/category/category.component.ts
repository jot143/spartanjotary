import { Component, OnInit, ViewEncapsulation, ElementRef } from '@angular/core';
import { ProductService } from 'src/app/service/product.service';
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
  parentsearch = '';
  parentsearchList = [];
  selectedParent: any = { id: 0, name: 'No Parent', parent_id: 0 };

  callback = {
    action: (x) => {
      this.parentsearchList = [];
      this.parentsearch = x.name;
      this.cat.parent_id = x.id;
      this.selectedParent = x;
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
                for (const i of childAry){
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
    console.log(this.cat);
    if (this.cat.name.length === 0) {
      this.alertService.error('Please fill proper category name'); return;
    }

    this.loaderService.start('Please Wait...', true);
    const response = this.restapi.post('/?object=product&action=addCategory', this.cat);
    response.subscribe((res: any) => {
      this.loaderService.dismiss();
      if (res && res.status && res.status === 'success') {
        if (this.selectedParent.id !== 0) {
          this.selectedParent.children.push({id: res.data, name: this.cat.name, parent_id: this.cat.parent_id});
        } else {
          this.productService.categories.push({id: res.data, name: this.cat.name, parent_id: this.cat.parent_id});
        }

        this.cat = {
          parent_id: 0,
          name: ''
        };

        this.dom.nativeElement.querySelector('#myModal').className = 'modal';
        this.dom.nativeElement.querySelector('#myModal').style.dispaly = 'none';
        this.alertService.success(res.msg);
      } else {
        this.alertService.error(res.msg);
      }
    });
  }

}
