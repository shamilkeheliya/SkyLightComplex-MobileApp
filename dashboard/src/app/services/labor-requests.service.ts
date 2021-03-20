import { LaborRequest } from './../models/LaborRequest';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Injectable({
  providedIn: 'root'
})
export class LaborRequestsService {
  laborRequestsCollection: AngularFirestoreCollection<LaborRequest>;
  laborRequests: Observable<LaborRequest[]>;

  constructor(private afs: AngularFirestore) {
    this.laborRequests = this.afs.collection("laborRequests", ref => ref.where("status", "in", ["Request","Get","Done"])).valueChanges();
  }

   getLaborRequests(){
     return this.laborRequests;
   }
}