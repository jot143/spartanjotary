import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PrintDamageComponent } from './print-damage.component';

describe('PrintDamageComponent', () => {
  let component: PrintDamageComponent;
  let fixture: ComponentFixture<PrintDamageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PrintDamageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PrintDamageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
