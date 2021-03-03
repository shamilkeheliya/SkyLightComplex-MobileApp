import { User } from './../../../models/User';
import { UserService } from './../../../services/user.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';
import { UsersAdduserComponent } from '../users-adduser/users-adduser.component';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {
  users: User[];
  usersCollection: AngularFirestoreCollection<Number>;
  userDoc: AngularFirestoreDocument<Number>;

  constructor(public dialog: MatDialog, 
    private usersService: UserService, 
    private afs: AngularFirestore,
    private snack: MatSnackBar,   ) { }

  ngOnInit(): void {
    this.usersService.getUsers().subscribe(users =>{
      this.users = users;
    })
  }

  addUser(){
    const dialogRef = this.dialog.open(UsersAdduserComponent,{
      height: 'auto',
      width: '600px',
    });
  }

  update(fn:any,ln:any,mob:any,mail:any,nic:any,uid:any){

    if(fn != '' && ln !='' && mob !='' && mail !='' && nic !='')
    {
      this.afs.collection('users').doc(uid).update({
        firstName: fn,
        lastName: ln,
        mobile: mob,
        email: mail,
        nic: nic
      }).then(()=>{
        this.snack.open('Updated Succusseful', 'OK',{
          duration:5000,
        })
      })
    }
    else
    {
      this.snack.open('Fields cannot be empty', "OK", {
        duration: 5000,
      });
    }
  }

  delete(value:any){
    this.afs.collection('users').doc(value).delete()
    .then(()=>{
      this.snack.open('Deleted Succusseful', 'OK',{
        duration:5000,
      })
    })

    //This is for testing add users
    /*this.afs.collection('users').add({
        keyNum : "2",
        firstName: "Keheliya",
        lastName: "Muhandiram",
        mobile: "0767474793",
        email: "shamilkeheliya@gmail.com",
        nic: "98546846258 V"
    })*/
  }

}
