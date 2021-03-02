import { LaborsAddlaborComponent } from './../labors-addlabor/labors-addlabor.component';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';

@Component({
  selector: 'app-labors-labors',
  templateUrl: './labors-labors.component.html',
  styleUrls: ['./labors-labors.component.css']
})
export class LaborsLaborsComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit(): void {
  }

  addLabor(){
    const dialogRef = this.dialog.open(LaborsAddlaborComponent,{
      height: 'auto',
      width: '600px',
    });
  }

}
