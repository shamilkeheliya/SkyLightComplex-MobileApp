import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComplainsReadComponent } from './complains-read.component';

describe('ComplainsReadComponent', () => {
  let component: ComplainsReadComponent;
  let fixture: ComponentFixture<ComplainsReadComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ComplainsReadComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ComplainsReadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
