import { ContactusService } from './../../../services/contactus.service';
import { Contactus } from './../../../models/Contactus';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';


@Component({
  selector: 'app-contactus-read',
  templateUrl: './contactus-read.component.html',
  styleUrls: ['./contactus-read.component.css']
})
export class ContactusReadComponent implements OnInit {

  contactus: Contactus[];
  contactusCollection: AngularFirestoreCollection<Contactus>;

  constructor(private contactService: ContactusService,private afs: AngularFirestore,) { }

  ngOnInit(): void {
    this.contactService.getReadContact().subscribe(contactus =>{
      this.contactus = contactus;
    })
  }
}
