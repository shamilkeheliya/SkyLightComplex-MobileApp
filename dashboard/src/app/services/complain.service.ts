import { Complain } from './../models/Complain';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Injectable({
  providedIn: 'root'
})
export class ComplainService {

  complainsCollection: AngularFirestoreCollection<Complain>;
  complains: Observable<Complain[]>;
  complainDoc: AngularFirestoreDocument<Complain>;

  complain_readCollection: AngularFirestoreCollection<Complain>;
  complains_read: Observable<Complain[]>;
  complain_readDoc: AngularFirestoreDocument<Complain>;

  constructor(private afs: AngularFirestore) { 
    this.complainsCollection=this.afs.collection("complains", ref => ref.where("read", "==", false));
    this.complains = this.complainsCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Complain;
        data.id = a.payload.doc.id;
        return data;
      })
    }))

    this.complain_readCollection=this.afs.collection("complains", ref => ref.where("read", "==", true));
    this.complains_read = this.complain_readCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Complain;
        data.id = a.payload.doc.id;
        return data;
      })
    }))
  }
  getComplain()
  {
    return this.complains;
  }

  getReadComplain()
  {
    return this.complains_read;
  }
}
