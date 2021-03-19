import { RequestsService } from './../../../services/requests.service';
import { Request } from './../../../models/Request';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-requests-new',
  templateUrl: './requests-new.component.html',
  styleUrls: ['./requests-new.component.css']
})
export class RequestsNewComponent implements OnInit {
  requests: Request[];
  requestsCollection: AngularFirestoreCollection<Request>;

  constructor(private contactService: RequestsService,private afs: AngularFirestore,) { }

  ngOnInit(): void {
    this.contactService.getRequest().subscribe(requests =>{
      this.requests = requests;
    })
  }

  read(value: any){
    this.afs.collection('requests').doc(value).update({
      status: 'read',
    })
  }

}
