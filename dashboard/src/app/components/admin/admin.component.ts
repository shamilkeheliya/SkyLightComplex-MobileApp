import { logging } from 'protractor';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router, RouterModule } from '@angular/router';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  
  loginForm = new FormGroup({
    email: new FormControl('',Validators.required),
    pwd: new FormControl('',Validators.required),
  })
;  constructor(
    public route: Router,
    private afs: AngularFirestore,
    private snack: MatSnackBar,
  ) { }
  
  ngOnInit(): void {}
    singin(){
      if (this.loginForm.value.email == 'skyadmin001') {

        this.afs.collection("admin").doc(this.loginForm.value.email).get().subscribe(da => {
          // console.log(da.data());
          if (this.loginForm.value.email == 'skyadmin001') {
            
            if (da.data()["pwd"] == this.loginForm.value.pwd) {
              this.route.navigate(['/dashboard']);
              //console.log("Logged User");
              this.snack.open('Login Succusseful', "ok", {
                duration: 3000,
              });
            } 
            else {
              this.snack.open('Invalid Login Attempt', "ok", {
                duration: 3000,
              });
            }
          }
          else {
            this.snack.open('Invalid Login Attempt', "ok", {
              duration: 3000,
            });
          }
        })
      }
      else {
        this.snack.open('Invalid Login Attempt', "ok", {
          duration: 3000,
        });
      }
    }
}
