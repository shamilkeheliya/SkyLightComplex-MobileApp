import { Report } from './../models/Report';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Injectable({
  providedIn: 'root'
})
export class ReportService {
  reportsCollection: AngularFirestoreCollection<Report>;
  reports: Observable<Report[]>;

  constructor(private afs: AngularFirestore) {

    this.reports = this.afs.collection("laborRequests", ref => ref.where("status", "==", "Reported")).valueChanges();
  }

   getReports(){
     return this.reports;
   }
}
 

