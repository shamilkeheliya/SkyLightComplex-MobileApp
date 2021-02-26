import { MatSnackBar } from '@angular/material/snack-bar';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Component,OnInit } from '@angular/core';

@Component({
  selector: 'app-users-adduser',
  templateUrl: './users-adduser.component.html',
  styleUrls: ['./users-adduser.component.css']
})
export class UsersAdduserComponent implements OnInit {

  addForm = new FormGroup({ 
    keyNum: new FormControl('',Validators.required),
    firstName: new FormControl('',Validators.required),
    lastName: new FormControl('',Validators.required),
    nic: new FormControl('',Validators.required), 
    mobile: new FormControl('',Validators.required),
    email: new FormControl('',Validators.required),
    pwd: new FormControl('',Validators.required), 
  });

;constructor(
    private afs: AngularFirestore,
    private snack: MatSnackBar,
    private fireauth: AngularFireAuth,
  ) { }
  
  ngOnInit(): void {}
    add(){
      this.fireauth.createUserWithEmailAndPassword(this.addForm.value.mail, this.addForm.value.pwd,).then(author =>{
        this.snack.open("New user added success", "OK",{duration: 5000,})

      })
      
    }
}
