import { LaborRequestsService } from './../../../services/labor-requests.service';
import { LaborRequest } from './../../../models/LaborRequest';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-labors-hiring',
  templateUrl: './labors-hiring.component.html',
  styleUrls: ['./labors-hiring.component.css']
})
export class LaborsHiringComponent implements OnInit{
  laborRequests: LaborRequest[];
  laborRequestsCollection: AngularFirestoreCollection<LaborRequest>;

  constructor(private laborRequestService: LaborRequestsService, private afs: AngularFirestore) { }

  ngOnInit(): void {
    this.laborRequestService.getLaborRequests().subscribe(laborRequests =>{
      this.laborRequests = laborRequests;
    })
  }

}
