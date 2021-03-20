import { TestBed } from '@angular/core/testing';

import { LaborRequestsService } from './labor-requests.service';

describe('LaborRequestsService', () => {
  let service: LaborRequestsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LaborRequestsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
