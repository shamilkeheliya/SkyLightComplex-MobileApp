import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LaborsReportsComponent } from './labors-reports.component';

describe('LaborsReportsComponent', () => {
  let component: LaborsReportsComponent;
  let fixture: ComponentFixture<LaborsReportsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LaborsReportsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LaborsReportsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
