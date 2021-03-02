import { MatSnackBar } from '@angular/material/snack-bar';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Component,OnInit } from '@angular/core';

@Component({
  selector: 'app-addnumber',
  templateUrl: './addnumber.component.html',
  styleUrls: ['./addnumber.component.css']
})
export class AddnumberComponent implements OnInit {

  addForm = new FormGroup({ 
    title: new FormControl('',Validators.required),
    number: new FormControl('',Validators.required),
  });

  ;constructor(
    private afs: AngularFirestore,
    private snack: MatSnackBar,
    private fireauth: AngularFireAuth,
  ) { }

  ngOnInit(): void {
  }
  add(){
    
  }
}
