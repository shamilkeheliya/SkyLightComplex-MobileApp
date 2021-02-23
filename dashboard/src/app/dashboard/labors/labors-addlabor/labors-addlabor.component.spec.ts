import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LaborsAddlaborComponent } from './labors-addlabor.component';

describe('LaborsAddlaborComponent', () => {
  let component: LaborsAddlaborComponent;
  let fixture: ComponentFixture<LaborsAddlaborComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LaborsAddlaborComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LaborsAddlaborComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
