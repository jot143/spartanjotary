import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CompareSaleComponent } from './compare-sale.component';

describe('CompareSaleComponent', () => {
  let component: CompareSaleComponent;
  let fixture: ComponentFixture<CompareSaleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CompareSaleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CompareSaleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
