import { ComplainService } from './../../../services/complain.service';
import { Complain } from './../../../models/Complain';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-complains-read',
  templateUrl: './complains-read.component.html',
  styleUrls: ['./complains-read.component.css']
})
export class ComplainsReadComponent implements OnInit {

  complains: Complain[];
  complainsCollection: AngularFirestoreCollection<Complain>;

  constructor(private commplainService: ComplainService,private afs: AngularFirestore,) { }

  ngOnInit(): void {
    this.commplainService.getReadComplain().subscribe(complains =>{
      this.complains = complains;
    })
  }
}