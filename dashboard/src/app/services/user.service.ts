import { Injectable } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';
import { User } from '../models/user';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  usersCollection: AngularFirestoreCollection<User>;
  users: Observable<User[]>;
  usersX: Observable<User[]>;

  constructor(private afs: AngularFirestore) {
    //this.users = this.afs.collection('users').valueChanges();
    this.users = this.afs.collection('users').snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as User;
        data.uid = a.payload.doc.id;
        return data;
      });
    }))

    this.usersX = this.afs.collection('users').valueChanges();
  }

  getUsers(){
    return this.users;
  }

  getU(){
    return this.usersX;
  }
}
