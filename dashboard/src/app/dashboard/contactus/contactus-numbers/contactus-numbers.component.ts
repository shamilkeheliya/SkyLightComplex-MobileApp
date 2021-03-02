import { AddnumberComponent } from './addnumber/addnumber.component';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';

@Component({
  selector: 'app-contactus-numbers',
  templateUrl: './contactus-numbers.component.html',
  styleUrls: ['./contactus-numbers.component.css']
})
export class ContactusNumbersComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
  }

  addNumber(){
    const dialogRef = this.dialog.open(AddnumberComponent,{
      height: 'auto',
      width: '600px',
    });
  }
}
