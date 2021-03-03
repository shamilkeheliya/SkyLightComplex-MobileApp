import { BookingsService } from './../../../services/bookings.service';
import { Booking } from './../../../models/Booking';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';


@Component({
  selector: 'app-bookings-new',
  templateUrl: './bookings-new.component.html',
  styleUrls: ['./bookings-new.component.css']
})
export class BookingsNewComponent implements OnInit {
  bookings: Booking[];
  bookings_newCollection: AngularFirestoreCollection<Booking>;
  bookingDoc: AngularFirestoreDocument<Booking>;

  constructor(
    private bookingsService: BookingsService,
    private afs: AngularFirestore,
    private snack: MatSnackBar, 
  ) { }

  ngOnInit(): void {
    this.bookingsService.getBookings_new().subscribe(bookings =>{
      this.bookings = bookings;
    })
  }

  accept(value: any){
    this.bookingsService.accept(value);
  }

  decline(value: any){
    this.bookingsService.decline(value);
  }

}
