import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StockcheckComponent } from './stockcheck.component';

describe('StockcheckComponent', () => {
  let component: StockcheckComponent;
  let fixture: ComponentFixture<StockcheckComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StockcheckComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StockcheckComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
