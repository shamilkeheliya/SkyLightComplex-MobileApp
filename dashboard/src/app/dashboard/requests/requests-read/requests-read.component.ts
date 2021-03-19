import { RequestsService } from './../../../services/requests.service';
import { Request } from './../../../models/Request';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-requests-read',
  templateUrl: './requests-read.component.html',
  styleUrls: ['./requests-read.component.css']
})
export class RequestsReadComponent implements OnInit {
  requests: Request[];
  requestsCollection: AngularFirestoreCollection<Request>;

  constructor(private requestService: RequestsService,private afs: AngularFirestore,) { }

  ngOnInit(): void {
    this.requestService.getReadRequest().subscribe(requests =>{
      this.requests = requests;
    })
  }

  send(id: any, msg: any){
    this.afs.collection('requests').doc(id).update({
      status: 'reply',
      reply: msg,
    })
  }

}