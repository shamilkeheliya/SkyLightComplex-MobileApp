import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LaborsLaborsComponent } from './labors-labors.component';

describe('LaborsLaborsComponent', () => {
  let component: LaborsLaborsComponent;
  let fixture: ComponentFixture<LaborsLaborsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LaborsLaborsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LaborsLaborsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
