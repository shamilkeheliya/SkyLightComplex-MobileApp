import { Booking } from '../../../models/Booking';
import { BookingsService } from './../../../services/bookings.service';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';


@Component({
  selector: 'app-feed-genaral',
  templateUrl: './feed-genaral.component.html',
  styleUrls: ['./feed-genaral.component.css']
})
export class FeedGenaralComponent implements OnInit {
  bookings: Booking[];

  constructor(private bookingsService: BookingsService, private afs: AngularFirestore) { }

  ngOnInit(): void {
    this.bookingsService.getBookings().subscribe(bookings => {
      this.bookings = bookings;
    })
  }
}
