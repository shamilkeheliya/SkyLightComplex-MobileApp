import { ComplainService } from './../../../services/complain.service';
import { Complain } from './../../../models/Complain';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-complains-new',
  templateUrl: './complains-new.component.html',
  styleUrls: ['./complains-new.component.css']
})
export class ComplainsNewComponent implements OnInit {
  complains: Complain[];
  complainsCollection: AngularFirestoreCollection<Complain>;

  constructor(private complainService: ComplainService,private afs: AngularFirestore,) { }

  ngOnInit(): void {
    this.complainService.getComplain().subscribe(complains =>{
      this.complains = complains;
    })
  }

  read(value: any){
    this.afs.collection('complains').doc(value).update({
      read: true
    })
  }

}

