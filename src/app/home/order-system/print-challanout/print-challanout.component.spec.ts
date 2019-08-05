import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PrintChallanoutComponent } from './print-challanout.component';

describe('PrintChallanoutComponent', () => {
  let component: PrintChallanoutComponent;
  let fixture: ComponentFixture<PrintChallanoutComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PrintChallanoutComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PrintChallanoutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
