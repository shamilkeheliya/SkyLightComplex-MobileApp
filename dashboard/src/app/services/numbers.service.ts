import { Number } from './../models/Number';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';


@Injectable({
  providedIn: 'root'
})
export class NumbersService {
  numbersCollection: AngularFirestoreCollection<Number>;
  numbers: Observable<Number[]>;
  numberDoc: AngularFirestoreDocument<Number>;

  constructor(private afs: AngularFirestore) {

    this.numbersCollection=this.afs.collection('numbers');

    this.numbers = this.numbersCollection.snapshotChanges().pipe(map(changes =>{
      return changes.map(a => {
        const data = a.payload.doc.data() as Number;
        data.id = a.payload.doc.id;
        return data;
      });
    }))
   }

   getNumbers(){
     return this.numbers;
   }

}
