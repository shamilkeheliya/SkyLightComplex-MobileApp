import { Event } from './../models/Event';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Injectable } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class EventService {
  eventsCollection: AngularFirestoreCollection<Event>;
  events: Observable<Event[]>;

  constructor(private afs: AngularFirestore,
    private snack: MatSnackBar) { 

      this.eventsCollection = this.afs.collection("events");
    this.events = this.eventsCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Event;
        data.id = a.payload.doc.id;
        return data;
      });
    }))
    }

    

  getEvents(){
    return this.events;
  }
}
