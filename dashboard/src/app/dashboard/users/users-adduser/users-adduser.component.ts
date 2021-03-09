import { Observable } from 'rxjs';
import { MatSnackBar } from '@angular/material/snack-bar';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormBuilder,FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Component,OnInit } from '@angular/core';
import { AngularFireStorage } from '@angular/fire/storage';

@Component({
  selector: 'app-users-adduser',
  templateUrl: './users-adduser.component.html',
  styleUrls: ['./users-adduser.component.css']
})
export class UsersAdduserComponent implements OnInit {

  addForm = this.fb.group({
    keyNum: new FormControl('',Validators.required),
    firstName: new FormControl('',Validators.required),
    lastName: new FormControl('',Validators.required),
    nic: new FormControl('',Validators.required),
    mobile: new FormControl('',Validators.required),
    email: new FormControl('',Validators.required),
    pwd:   new FormControl('',Validators.required),
  })
 
 
;constructor(
    private afs: AngularFirestore,
    private snack: MatSnackBar,
    private fireauth: AngularFireAuth,
    private storage: AngularFireStorage,
    private fb: FormBuilder,
    private fireStore: AngularFirestore,
  ) { }
  
  ngOnInit(): void {}
    add(){
      this.fireauth.createUserWithEmailAndPassword(this.addForm.value.mail, this.addForm.value.pwd,).then(author =>{
        alert("adding success")
          this.fireStore.collection('users').doc(author.user.uid).set({

            firstName:this.addForm.value.firstName,
            lastName: this.addForm.value.lastName,
            nic: this.addForm.value.nic,
            mobile: this.addForm.value.mobile,
            email:this.addForm.value.email, 
            pwd: this.addForm.value.pwd,

          });
      })
      
    }
}
 