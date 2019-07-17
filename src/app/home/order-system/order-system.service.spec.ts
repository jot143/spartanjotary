import { TestBed } from '@angular/core/testing';

import { OrderSystemService } from './order-system.service';

describe('OrderSystemService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OrderSystemService = TestBed.get(OrderSystemService);
    expect(service).toBeTruthy();
  });
});
