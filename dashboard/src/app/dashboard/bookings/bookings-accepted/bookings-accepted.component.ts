import { BookingsService } from './../../../services/bookings.service';
import { Booking } from './../../../models/Booking';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';


@Component({
  selector: 'app-bookings-accepted',
  templateUrl: './bookings-accepted.component.html',
  styleUrls: ['./bookings-accepted.component.css']
})
export class BookingsAcceptedComponent implements OnInit {
  bookings: Booking[];
  bookings_newCollection: AngularFirestoreCollection<Booking>;
  bookingDoc: AngularFirestoreDocument<Booking>;

  constructor(
    private bookingsService: BookingsService,
    private afs: AngularFirestore,
    private snack: MatSnackBar, 
  ) { }

  ngOnInit(): void {
    this.bookingsService.getBookings_accepted().subscribe(bookings =>{
      this.bookings = bookings;
    })
  }

  decline(value: any){
    this.bookingsService.decline(value);
  }

}
