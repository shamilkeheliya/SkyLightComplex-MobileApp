import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FeedAddeventComponent } from './feed-addevent.component';

describe('FeedAddeventComponent', () => {
  let component: FeedAddeventComponent;
  let fixture: ComponentFixture<FeedAddeventComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FeedAddeventComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FeedAddeventComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
