import { ContactusService } from './../../../services/contactus.service';
import { Contactus } from './../../../models/Contactus';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';


@Component({
  selector: 'app-contactus-new',
  templateUrl: './contactus-new.component.html',
  styleUrls: ['./contactus-new.component.css']
})
export class ContactusNewComponent implements OnInit {
  contactus: Contactus[];
  contactusCollection: AngularFirestoreCollection<Contactus>;

  constructor(private contactService: ContactusService,private afs: AngularFirestore,) { }

  ngOnInit(): void {
    this.contactService.getContact().subscribe(contactus =>{
      this.contactus = contactus;
    })
  }

  read(value: any){
    this.afs.collection('contactus').doc(value).update({
      read: true
    })
  }

}
