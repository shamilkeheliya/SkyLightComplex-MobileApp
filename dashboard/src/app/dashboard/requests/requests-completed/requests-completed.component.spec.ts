import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RequestsCompletedComponent } from './requests-completed.component';

describe('RequestsCompletedComponent', () => {
  let component: RequestsCompletedComponent;
  let fixture: ComponentFixture<RequestsCompletedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RequestsCompletedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RequestsCompletedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
