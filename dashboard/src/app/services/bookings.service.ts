import { MatSnackBar } from '@angular/material/snack-bar';
import { Booking } from '../models/Booking';
import { Injectable } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class BookingsService {
  bookingsCollection: AngularFirestoreCollection<Booking>;
  bookings: Observable<Booking[]>;

  bookings_newCollection: AngularFirestoreCollection<Booking>;
  bookings_new: Observable<Booking[]>

  bookings_acceptedCollection: AngularFirestoreCollection<Booking>;
  bookings_accepted: Observable<Booking[]>

  bookings_declinedCollection: AngularFirestoreCollection<Booking>;
  bookings_declined: Observable<Booking[]>

  constructor(private afs: AngularFirestore,
    private snack: MatSnackBar ) {
    this.bookings = this.afs.collection("bookings", ref => ref.where("accept", "==", true)).valueChanges();

    this.bookings_acceptedCollection = this.afs.collection("bookings", ref => ref.where("accept","==",true));
    this.bookings_accepted = this.bookings_acceptedCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Booking;
        data.id = a.payload.doc.id;
        return data;
      });
    }))

    this.bookings_newCollection = this.afs.collection("bookings", ref => ref.where("read","==",false));
    this.bookings_new = this.bookings_newCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Booking;
        data.id = a.payload.doc.id;
        return data;
      });
    }))

    this.bookings_declinedCollection = this.afs.collection("bookings", ref => ref.where("accept","==",false));
    this.bookings_declined = this.bookings_declinedCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Booking;
        data.id = a.payload.doc.id;
        return data;
      });
    }))

  }

  getBookings(){
    return this.bookings;
  }

  getBookings_new(){
    return this.bookings_new;
  }

  getBookings_accepted(){
    return this.bookings_accepted;
  }

  getBookings_declined(){
    return this.bookings_declined;
  }

  accept(value: any){
    this.afs.collection('bookings').doc(value).update({
      accept: true,
      read: true,
    }).then(()=>{
      this.snack.open('Accepted Succusseful', 'OK',{
        duration:5000,
      })
    })
  }

  decline(value: any){
    this.afs.collection('bookings').doc(value).update({
      accept: false,
      read: true,
    }).then(()=>{
      this.snack.open('Declined Succusseful', 'OK',{
        duration:5000,
      })
    })
  }
}
