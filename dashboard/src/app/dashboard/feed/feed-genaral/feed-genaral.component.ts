import { User } from './../../../models/User';
import { Observable } from 'rxjs';
import { Booking } from './../../../models/Booking';
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
  user: Observable<User[]>

  constructor(private bookingsService: BookingsService, private afs: AngularFirestore) { }

  ngOnInit(): void {
    this.bookingsService.getBookings().subscribe(bookings => {
      this.bookings = bookings;
    }) 
  }

  
  getUser(uid: any){
    this.user = this.afs.collection('users').valueChanges();
    // this.user = this.afs.collection('users').doc(uid).get();
    //console.log(this.user.subscribe(users =>{this.user = users;}));
    //return user;
    //return this.user;
  }
}
