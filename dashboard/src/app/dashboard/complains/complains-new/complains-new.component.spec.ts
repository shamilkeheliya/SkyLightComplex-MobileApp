import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComplainsNewComponent } from './complains-new.component';

describe('ComplainsNewComponent', () => {
  let component: ComplainsNewComponent;
  let fixture: ComponentFixture<ComplainsNewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ComplainsNewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ComplainsNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
