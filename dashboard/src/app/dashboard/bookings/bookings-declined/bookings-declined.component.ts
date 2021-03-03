import { BookingsService } from './../../../services/bookings.service';
import { Booking } from './../../../models/Booking';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';


@Component({
  selector: 'app-bookings-declined',
  templateUrl: './bookings-declined.component.html',
  styleUrls: ['./bookings-declined.component.css']
})
export class BookingsDeclinedComponent implements OnInit {
  bookings: Booking[];
  bookings_newCollection: AngularFirestoreCollection<Booking>;
  bookingDoc: AngularFirestoreDocument<Booking>;

  constructor(
    private bookingsService: BookingsService,
    private afs: AngularFirestore,
    private snack: MatSnackBar, 
  ) { }

  ngOnInit(): void {
    this.bookingsService.getBookings_declined().subscribe(bookings =>{
      this.bookings = bookings;
    })
  }

  accept(value: any){
    this.bookingsService.accept(value);
  }
}
