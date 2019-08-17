import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CompiledSaleComponent } from './compiled-sale.component';

describe('CompiledSaleComponent', () => {
  let component: CompiledSaleComponent;
  let fixture: ComponentFixture<CompiledSaleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CompiledSaleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CompiledSaleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
