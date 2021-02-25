import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BookingsAcceptedComponent } from './bookings-accepted.component';

describe('BookingsAcceptedComponent', () => {
  let component: BookingsAcceptedComponent;
  let fixture: ComponentFixture<BookingsAcceptedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BookingsAcceptedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BookingsAcceptedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
