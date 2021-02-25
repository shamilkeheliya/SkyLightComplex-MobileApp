import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContactusNewComponent } from './contactus-new.component';

describe('ContactusNewComponent', () => {
  let component: ContactusNewComponent;
  let fixture: ComponentFixture<ContactusNewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContactusNewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContactusNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
