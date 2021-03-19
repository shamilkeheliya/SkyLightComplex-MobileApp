import { RequestsService } from './../../../services/requests.service';
import { Request } from './../../../models/Request';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-requests-completed',
  templateUrl: './requests-completed.component.html',
  styleUrls: ['./requests-completed.component.css']
})
export class RequestsCompletedComponent implements OnInit {
  requests: Request[];
  requestsCollection: AngularFirestoreCollection<Request>;

  constructor(private requestService: RequestsService,private afs: AngularFirestore,) { }

  ngOnInit(): void {
    this.requestService.getDoneRequest().subscribe(requests =>{
      this.requests = requests;
    })
  }
}
