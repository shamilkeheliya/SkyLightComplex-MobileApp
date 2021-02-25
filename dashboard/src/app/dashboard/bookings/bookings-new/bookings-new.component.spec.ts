import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BookingsNewComponent } from './bookings-new.component';

describe('BookingsNewComponent', () => {
  let component: BookingsNewComponent;
  let fixture: ComponentFixture<BookingsNewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BookingsNewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BookingsNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
