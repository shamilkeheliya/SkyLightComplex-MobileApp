import { Contactus } from './../models/Contactus';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Injectable({
  providedIn: 'root'
})
export class ContactusService {
  contactsCollection: AngularFirestoreCollection<Contactus>;
  contacts: Observable<Contactus[]>;
  contactDoc: AngularFirestoreDocument<Contactus>;

  contact_readCollection: AngularFirestoreCollection<Contactus>;
  contacts_read: Observable<Contactus[]>;
  contact_readDoc: AngularFirestoreDocument<Contactus>;

  constructor(private afs: AngularFirestore) { 

    this.contactsCollection=this.afs.collection("contactus", ref => ref.where("read", "==", false));
    this.contacts = this.contactsCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Contactus;
        data.id = a.payload.doc.id;
        return data;
      })
    }))

    this.contact_readCollection=this.afs.collection("contactus", ref => ref.where("read", "==", true));
    this.contacts_read = this.contact_readCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Contactus;
        data.id = a.payload.doc.id;
        return data;
      })
    }))
  }
  getContact()
  {
    return this.contacts;
  }

  getReadContact()
  {
    return this.contacts_read;
  }
}
