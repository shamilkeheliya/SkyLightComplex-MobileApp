import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BookingsDeclinedComponent } from './bookings-declined.component';

describe('BookingsDeclinedComponent', () => {
  let component: BookingsDeclinedComponent;
  let fixture: ComponentFixture<BookingsDeclinedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BookingsDeclinedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BookingsDeclinedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
