import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LaborsHiringComponent } from './labors-hiring.component';

describe('LaborsHiringComponent', () => {
  let component: LaborsHiringComponent;
  let fixture: ComponentFixture<LaborsHiringComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LaborsHiringComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LaborsHiringComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
