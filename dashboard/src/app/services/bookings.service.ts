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

  constructor(private afs: AngularFirestore) {
    this.bookings = this.afs.collection("bookings", ref => ref.where("accept", "==", true)).valueChanges();
  }

  getBookings(){
    return this.bookings;
  }
}
