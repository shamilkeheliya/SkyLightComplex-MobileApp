import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UsersAdduserComponent } from './users-adduser.component';

describe('UsersAdduserComponent', () => {
  let component: UsersAdduserComponent;
  let fixture: ComponentFixture<UsersAdduserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UsersAdduserComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UsersAdduserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
