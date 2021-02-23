import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FeedGenaralComponent } from './feed-genaral.component';

describe('FeedGenaralComponent', () => {
  let component: FeedGenaralComponent;
  let fixture: ComponentFixture<FeedGenaralComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FeedGenaralComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FeedGenaralComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
