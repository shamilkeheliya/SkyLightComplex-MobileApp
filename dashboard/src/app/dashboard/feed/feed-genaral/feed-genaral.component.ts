
import { UserService } from './../../../services/user.service';
import { User } from './../../../models/User';
import { Observable } from 'rxjs';
import { Booking } from './../../../models/Booking';
import { BookingsService } from './../../../services/bookings.service';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';
import { map } from 'rxjs/operators';
import { fn } from '@angular/compiler/src/output/output_ast';


@Component({
  selector: 'app-feed-genaral',
  templateUrl: './feed-genaral.component.html',
  styleUrls: ['./feed-genaral.component.css']
})
export class FeedGenaralComponent implements OnInit {
  bookings: Booking[];
  
 

  constructor(private bookingsService: BookingsService,
              private afs: AngularFirestore,
              private userService: UserService) { }

  ngOnInit(): void {
    this.bookingsService.getBookings().subscribe(bookings => {
      this.bookings = bookings;
    }) 

    //this.afs.collection('users').doc().get().then(function(querySnapshot){querySnapshot.forEach(function(doc){var docData = doc.data();})})
  }

  
  // getFirstName(id: any){
  //   this.usersX = this.afs.collection('users', ref => ref.where("uid", "==", id)).valueChanges();

  //   this.usersX.subscribe(users => {
  //     this.users = users;
  //   })
  //   let fname;
  //   for(let user of this.users){
  //       fname = user.firstName;
  //   }
  //   return fname;
  // }

  // fname  = null;

  // public getFirstName(id: any, usersX:Observable<User[]>){
    
  //   usersX = this.afs.collection('users', ref => ref.where("uid", "==", id)).valueChanges();
    
  //   usersX.subscribe(users => {
  //     for(let user of users){
  //       this.fname = user.firstName;
  //     }
  //   })
  //   return this.fname;
  // }

  // usersX:Observable<User[]>
  // x = 0;
  // public getFirstName(id: any){
  //   if(this.x<2000){
  //     this.x++;
  //     console.log(this.x);
  //     //console.log(this.fnameServise.getfn(id));
  //     return this.fnameServise.getfn(id);
  //   }
  // }

  // getLastName(id: any){
  //   this.usersX = this.afs.collection('users', ref => ref.where("uid", "==", id)).valueChanges();

  //   this.usersX.subscribe(users => {
  //     this.users = users;
  //   })
  //   let lname;
  //   for(let user of this.users){
  //       lname = user.lastName;
  //       //console.log(user.firstName);
  //   }
  //   return lname;
  // }

  // getProfileURL(id: any){
  //   this.usersX = this.afs.collection('users', ref => ref.where("uid", "==", id)).valueChanges();

  //   this.usersX.subscribe(users => {
  //     this.users = users;
  //   })

  //   let url;
  //   for(let user of this.users){
  //       url= user.profileURL;
  //       //console.log(user.firstName);
  //   }
  //   return url;
  // }

  //   getFirstName(id: any){

  //     let fname=null;

  //     this.afs.collection('users').doc(id).get().then((value) =>{
  //       fname = value['FirstName'];
  //       });
        
  // }

  // getFirstName(id:any){
  //   let x = this.afs.collection('users').doc(id);    
  //   console.log(x['firstName']);
  // }
}
