import { MatDialogModule } from '@angular/material/dialog';
import { Number } from './../../../../models/Number';
import { NumbersService } from './../../../../services/numbers.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Component,OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-addnumber',
  templateUrl: './addnumber.component.html',
  styleUrls: ['./addnumber.component.css']
})
export class AddnumberComponent implements OnInit {

  addForm = new FormGroup({ 
    na: new FormControl('',Validators.required),
    num: new FormControl('',Validators.required),
  });


  ;constructor(
    private afs: AngularFirestore,
    private snack: MatSnackBar,
    private fireauth: AngularFireAuth,
    private numberService: NumbersService,
  ) { }

  ngOnInit(): void {
  }

  onSubmit(){

    if(this.addForm.value.na != '' && this.addForm.value.num != '')
    {
      this.afs.collection('numbers').add({
        name: this.addForm.value.na,
        number: this.addForm.value.num
      }).then(()=>{
        this.snack.open(this.addForm.value.na + ' Added Succusseful', "OK", {
          duration: 5000,
        });
      })
    }
    else
    {
      this.snack.open('Fields cannot be empty', "OK", {
        duration: 5000,
      });
    }
  }

  
}
