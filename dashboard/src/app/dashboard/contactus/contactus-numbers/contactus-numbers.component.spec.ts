import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContactusNumbersComponent } from './contactus-numbers.component';

describe('ContactusNumbersComponent', () => {
  let component: ContactusNumbersComponent;
  let fixture: ComponentFixture<ContactusNumbersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContactusNumbersComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContactusNumbersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
