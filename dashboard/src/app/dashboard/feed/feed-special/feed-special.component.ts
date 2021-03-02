import { FeedAddeventComponent } from './../feed-addevent/feed-addevent.component';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';

@Component({
  selector: 'app-feed-special',
  templateUrl: './feed-special.component.html',
  styleUrls: ['./feed-special.component.css']
})
export class FeedSpecialComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
  }

  addEvent(){
    const dialogRef = this.dialog.open(FeedAddeventComponent,{
      height: 'auto',
      width: '600px',
    });
  }

}
