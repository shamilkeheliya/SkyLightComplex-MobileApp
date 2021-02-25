import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NotificationsFixedComponent } from './notifications-fixed.component';

describe('NotificationsFixedComponent', () => {
  let component: NotificationsFixedComponent;
  let fixture: ComponentFixture<NotificationsFixedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NotificationsFixedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NotificationsFixedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
