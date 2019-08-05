import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PrintChallaninComponent } from './print-challanin.component';

describe('PrintChallaninComponent', () => {
  let component: PrintChallaninComponent;
  let fixture: ComponentFixture<PrintChallaninComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PrintChallaninComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PrintChallaninComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
