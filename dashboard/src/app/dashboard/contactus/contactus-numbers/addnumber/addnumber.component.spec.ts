import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddnumberComponent } from './addnumber.component';

describe('AddnumberComponent', () => {
  let component: AddnumberComponent;
  let fixture: ComponentFixture<AddnumberComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddnumberComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddnumberComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
