import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OrderSystemComponent } from './order-system.component';

describe('OrderSystemComponent', () => {
  let component: OrderSystemComponent;
  let fixture: ComponentFixture<OrderSystemComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OrderSystemComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OrderSystemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
