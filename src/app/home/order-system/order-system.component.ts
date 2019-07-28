import { Component, OnInit, OnDestroy, ViewEncapsulation } from '@angular/core';
import { Route, ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { SubjectService } from '../persons/service/subject.service';
import { ProductService } from '../products/product.service';

@Component({
  selector: 'app-order-system',
  templateUrl: './order-system.component.html',
  styleUrls: ['./order-system.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class OrderSystemComponent implements OnInit, OnDestroy {
  activeRouteSubscriber: any;
  subjectServiceSubscriber: any;
  productServiceSubscriber: any;
  object: any;
  schema: any;

  form: any;

  constructor(
              public router: Router,
              public activeRoute: ActivatedRoute,
              public subjectService: SubjectService,
              public productService: ProductService) {

  }

  ngOnInit() {
    this.productServiceSubscriber = this.productService.$products.subscribe();
    this.subjectServiceSubscriber = this.subjectService.$subjects.subscribe();
    this.activeRouteSubscriber = this.activeRoute.data.subscribe((data: any) => {
      this.object = data.object;
      this.schema = data.schema;
      console.log(this.schema);
    });
  }

  ngOnDestroy() {
    this.activeRouteSubscriber.unsubscribe();
    this.subjectServiceSubscriber.unsubscribe();
    this.productServiceSubscriber.unsubscribe();
  }

  openAddForm() {
    const url = '/home/order-system/' + this.schema.object + '/add';
    this.router.navigate([url]);
  }
}
