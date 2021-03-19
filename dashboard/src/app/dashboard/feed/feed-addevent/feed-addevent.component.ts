import { Observable } from 'rxjs';
import { MatSnackBar } from '@angular/material/snack-bar';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormBuilder,FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Component,OnInit } from '@angular/core';
import { AngularFireStorage } from '@angular/fire/storage';

@Component({
  selector: 'app-feed-addevent',
  templateUrl: './feed-addevent.component.html',
  styleUrls: ['./feed-addevent.component.css']
})
export class FeedAddeventComponent implements OnInit {

  addForm = this.fb.group({
    firstName: new FormControl('',[Validators.required]),
    lastName: new FormControl('',[Validators.required]),
    nic: new FormControl('',[Validators.required,Validators.minLength(10),Validators.maxLength(12)]),
    mobile: new FormControl('',[Validators.required,Validators.minLength(10),Validators.maxLength(10)]),
    email: new FormControl('',[Validators.required,Validators.email]),
    pwd:   new FormControl('',[Validators.required]),
    type: new FormControl('',[Validators.required]),
  })

  constructor(
    private afs: AngularFirestore,
    private snack: MatSnackBar,
    private fireauth: AngularFireAuth,
    private storage: AngularFireStorage,
    private fb: FormBuilder,
    private fireStore: AngularFirestore,) { }

  ngOnInit(): void {
  }

  add(){}
}
