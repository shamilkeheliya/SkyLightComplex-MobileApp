import { Labor } from './../models/Labor';
import { Injectable } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class LaborService {
  laborsCollection: AngularFirestoreCollection<Labor>;
  labors: Observable<Labor[]>;

  constructor(private afs: AngularFirestore) {
    this.labors = this.afs.collection('labors').snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Labor;
        data.lid = a.payload.doc.id;
        return data;
      });
    }))
  }

  getLabors(){
    return this.labors;
  }
     
}
