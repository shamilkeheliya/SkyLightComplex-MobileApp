import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RequestsReadComponent } from './requests-read.component';

describe('RequestsReadComponent', () => {
  let component: RequestsReadComponent;
  let fixture: ComponentFixture<RequestsReadComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RequestsReadComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RequestsReadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
