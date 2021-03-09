import { NumbersService } from './../../../services/numbers.service';
import { Number } from './../../../models/Number';
import { AddnumberComponent } from './addnumber/addnumber.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';
import { stringify } from '@angular/compiler/src/util';
import { analyzeAndValidateNgModules } from '@angular/compiler';

@Component({
  selector: 'app-contactus-numbers',
  templateUrl: './contactus-numbers.component.html',
  styleUrls: ['./contactus-numbers.component.css']
})
export class ContactusNumbersComponent implements OnInit {
  numbers: Number[];
  numbersCollection: AngularFirestoreCollection<Number>;
  numberDoc: AngularFirestoreDocument<Number>;


  constructor(
    public dialog: MatDialog, 
    private numbersService: NumbersService, 
    private afs: AngularFirestore,
    private snack: MatSnackBar,   
    ) { }

  ngOnInit(): void {
    this.numbersService.getNumbers().subscribe(numbers =>{
      this.numbers = numbers;
    })
  }

  addNumber(){
    const dialogRef = this.dialog.open(AddnumberComponent,{
      height: 'auto',
      width: '600px',
    });
    dialogRef.afterClosed()
  }

  update(nm: any, num:any, id: any){
    if(nm != '' && num !='')
    {
      this.afs.collection('numbers').doc(id).update({
        name: nm,
        number: num
      }).then(()=>{
        this.snack.open(nm +' Updated Succusseful', 'OK',{
          duration:5000,
        })
      })
    }
    else
    {
      this.snack.open('Fields cannot be empty', "OK", {
        duration: 3000,
      });
    }
  }
  
  // update(){
  //   this.afs.collection('numbers').doc(this.addForm.value.id).set({
  //     name: this.addForm.value.na,
  //     number: this.addForm.value.num
  //   }).then(()=>{
  //     this.snack.open('Updated Succusseful', "ok", {
  //       duration: 3000,
  //     });
  //   })
  // }

  delete(value:any){
    this.afs.collection('numbers').doc(value).delete()
    .then(()=>{
      this.snack.open('Deleted Succusseful', 'OK',{
        duration:5000,
      })
    })
  }
  
}
