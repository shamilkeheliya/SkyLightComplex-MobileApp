import { LaborService } from './../../../services/labor.service';
import { Labor } from './../../../models/Labor';
import { LaborsAddlaborComponent } from './../labors-addlabor/labors-addlabor.component';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-labors-labors',
  templateUrl: './labors-labors.component.html',
  styleUrls: ['./labors-labors.component.css']
})
export class LaborsLaborsComponent implements OnInit {
  labors: Labor[];
  laborsCollection: AngularFirestoreCollection<Labor>;
  laborDoc: AngularFirestoreDocument<Labor>;

  constructor(public dialog: MatDialog, 
    private laborsService: LaborService, 
    private afs: AngularFirestore,
    private snack: MatSnackBar,   ) { }

  ngOnInit(): void {
    this.laborsService.getLabors().subscribe(labors =>{
      this.labors = labors;
    })
  }

  addLabor(){
    const dialogRef = this.dialog.open(LaborsAddlaborComponent,{
      height: 'auto',
      width: '600px',
    });
    dialogRef.afterClosed();
  }

  
  update(fn:any,ln:any,mob:any,nic:any,lid:any){

    if(fn != '' && ln !='' && mob !='' && nic !='')
    {
      this.afs.collection('labors').doc(lid).update({
        firstName: fn,
        lastName: ln,
        mobile: mob,
        nic: nic,
      }).then(()=>{
        this.snack.open('Updated Succusseful', 'OK',{
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

  delete(value:any){
    this.afs.collection('labors').doc(value).delete()
    .then(()=>{
      this.snack.open('Deleted Succusseful', 'OK',{
        duration:5000,
      })
    })

    //This is for testing add labors
    /*this.afs.collection('labors').add({
        
        firstName: "Keheliya",
        lastName: "Muhandiram",
        mobile: "0767474793",
        type: "Electrician",
        nic: "98546846258 V"
    })*/
  }
}
