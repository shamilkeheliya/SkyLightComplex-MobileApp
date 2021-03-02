import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { UsersAdduserComponent } from '../users-adduser/users-adduser.component';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
    
  }

  addUser(){
    const dialogRef = this.dialog.open(UsersAdduserComponent,{
      height: 'auto',
      width: '600px',
    });
  }

}
