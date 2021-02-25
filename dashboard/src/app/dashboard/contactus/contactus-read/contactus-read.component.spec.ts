import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContactusReadComponent } from './contactus-read.component';

describe('ContactusReadComponent', () => {
  let component: ContactusReadComponent;
  let fixture: ComponentFixture<ContactusReadComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContactusReadComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContactusReadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
