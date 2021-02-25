import { logging } from 'protractor';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-labors-addlabor',
  templateUrl: './labors-addlabor.component.html',
  styleUrls: ['./labors-addlabor.component.css']
})
export class LaborsAddlaborComponent implements OnInit {

  addForm = new FormGroup({
    keyNum: new FormControl('',Validators.required),
    firstName: new FormControl('',Validators.required),
    lastName: new FormControl('',Validators.required),
    nic: new FormControl('',Validators.required),
    type: new FormControl('',Validators.required),
    mobile: new FormControl('',Validators.required),
    email: new FormControl('',Validators.required),
  })
;  constructor(
    private afs: AngularFirestore,
    private snack: MatSnackBar,
  ) { }
  
  ngOnInit(): void {}
    add(){
      
    }

}
