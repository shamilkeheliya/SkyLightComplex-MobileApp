import { Observable } from 'rxjs';
import { MatSnackBar } from '@angular/material/snack-bar';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormBuilder,FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Component,OnInit } from '@angular/core';
import { AngularFireStorage } from '@angular/fire/storage';

@Component({
  selector: 'app-labors-addlabor',
  templateUrl: './labors-addlabor.component.html',
  styleUrls: ['./labors-addlabor.component.css']
})
export class LaborsAddlaborComponent implements OnInit {

  addForm = this.fb.group({
    firstName: new FormControl('',[Validators.required]),
    lastName: new FormControl('',[Validators.required]),
    nic: new FormControl('',[Validators.required,Validators.minLength(10),Validators.maxLength(12)]),
    mobile: new FormControl('',[Validators.required,Validators.minLength(10),Validators.maxLength(10)]),
    email: new FormControl('',[Validators.required,Validators.email]),
    pwd:   new FormControl('',[Validators.required]),
    type: new FormControl('',[Validators.required]),
  })
;  constructor(
  private afs: AngularFirestore,
  private snack: MatSnackBar,
  private fireauth: AngularFireAuth,
  private storage: AngularFireStorage,
  private fb: FormBuilder,
  private fireStore: AngularFirestore,
  ) { }
  
  ngOnInit(): void {}
    
  add(){
    this.fireauth.createUserWithEmailAndPassword(this.addForm.value.email, this.addForm.value.pwd,).then(author =>{
      this.snack.open('New User Added Succusseful', 'OK',{
        duration:5000,
      })
        this.fireStore.collection('labors').doc(author.user.uid).set({

          firstName:this.addForm.value.firstName,
          lastName: this.addForm.value.lastName,
          nic: this.addForm.value.nic,
          mobile: this.addForm.value.mobile,
          email:this.addForm.value.email, 
          pwd: this.addForm.value.pwd,
          uid: author.user.uid,
          type: this.addForm.value.type,
          rating: 0,
          stars: 0,
          ratingCount: 0,
          profileURL: "https://firebasestorage.googleapis.com/v0/b/mobileapp-b9de2.appspot.com/o/profilePicture.jpg?alt=media&token=fc48816b-9fac-4170-a1da-9d1f07d4f1a3",

        });
    })  
  }

}
