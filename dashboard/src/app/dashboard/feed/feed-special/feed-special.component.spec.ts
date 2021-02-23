import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FeedSpecialComponent } from './feed-special.component';

describe('FeedSpecialComponent', () => {
  let component: FeedSpecialComponent;
  let fixture: ComponentFixture<FeedSpecialComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FeedSpecialComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FeedSpecialComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
