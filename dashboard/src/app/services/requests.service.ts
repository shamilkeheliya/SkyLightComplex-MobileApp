import { Request } from './../models/Request';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Injectable({
  providedIn: 'root'
})
export class RequestsService {

  requestsCollection: AngularFirestoreCollection<Request>;
  requests: Observable<Request[]>;
  requestDoc: AngularFirestoreDocument<Request>;

  request_readCollection: AngularFirestoreCollection<Request>;
  requests_read: Observable<Request[]>;
  request_readDoc: AngularFirestoreDocument<Request>;

  request_doneCollection: AngularFirestoreCollection<Request>;
  requests_done: Observable<Request[]>;
  request_doneDoc: AngularFirestoreDocument<Request>;

  constructor(private afs: AngularFirestore) { 
    this.requestsCollection=this.afs.collection("requests", ref => ref.where("status", "==", "request"));
    this.requests = this.requestsCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Request;
        data.id = a.payload.doc.id;
        return data;
      })
    }))

    this.request_readCollection=this.afs.collection("requests", ref => ref.where("status", "==", "read"));
    this.requests_read = this.request_readCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Request;
        data.id = a.payload.doc.id;
        return data;
      })
    }))

    this.request_doneCollection=this.afs.collection("requests", ref => ref.where("status", "==", "reply"));
    this.requests_done = this.request_doneCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Request;
        data.id = a.payload.doc.id;
        return data;
      })
    }))
  }
  getRequest()
  {
    return this.requests;
  }

  getReadRequest()
  {
    return this.requests_read;
  }

  getDoneRequest()
  {
    return this.requests_done;
  }
}
