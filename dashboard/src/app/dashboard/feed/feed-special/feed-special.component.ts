import { EventService } from './../../../services/event.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable } from 'rxjs';
import { Event } from './../../../models/Event';
import { FeedAddeventComponent } from './../feed-addevent/feed-addevent.component';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-feed-special',
  templateUrl: './feed-special.component.html',
  styleUrls: ['./feed-special.component.css']
})
export class FeedSpecialComponent implements OnInit {
  events: Event[];

  constructor(
    public dialog: MatDialog,
    private afs: AngularFirestore,
    private snack: MatSnackBar,
    private eventService: EventService) { }

  ngOnInit(): void {
    this.eventService.getEvents().subscribe(events => {
      this.events = events;
    })
  }

  addEvent(){
    const dialogRef = this.dialog.open(FeedAddeventComponent,{
      height: 'auto',
      width: '600px',
    });
  }

  delete(value:any){
    this.afs.collection('events').doc(value).delete()
    .then(()=>{
      this.snack.open('Deleted Succusseful', 'OK',{
        duration:5000,
      })
    })
    //console.log(value);
  }

}
