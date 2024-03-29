import { Observable } from 'rxjs';
import { MatSnackBar } from '@angular/material/snack-bar';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormBuilder,FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Component,OnInit } from '@angular/core';
import { AngularFireStorage } from '@angular/fire/storage';
import { finalize } from 'rxjs/operators';

@Component({
  selector: 'app-feed-addevent',
  templateUrl: './feed-addevent.component.html',
  styleUrls: ['./feed-addevent.component.css']
})
export class FeedAddeventComponent implements OnInit {
uploadPercent:Observable<number>
downloadURL:Observable<string>
  form = this.fb.group({
    eventTitle: new FormControl('',[Validators.required]),
    eventDescription: new FormControl('',[Validators.required]),
    eventDate: new FormControl('',[Validators.required]),
    eventTime: new FormControl('',[Validators.required]),
  })

  constructor(
    private afs: AngularFirestore,
    private snack: MatSnackBar,
    // private fireauth: AngularFireAuth,
    private storage: AngularFireStorage,
    private fb: FormBuilder,
    ) { }

  ngOnInit(): void {
  }

  addEvent() {
    if (this.form.valid) {
      if (this.downloadURL) {
        this.downloadURL.subscribe(url=>{
          this.afs.collection('events').add({
            title: this.form.value.eventTitle,
            description: this.form.value.eventDescription,
            date: this.form.value.eventDate,
            time: this.form.value.eventTime,
            imageURL: url
          }).then(() => {
            this.snack.open("Added success", "ok");
          })
        })
      }
    }
  }
  
  uploadFile(event) {
  
    let name = new Date();
    const file = event.target.files[0];
    const filePath = name.getTime().toString();
    let n = ("eventImages/"+filePath);
    const fileRef = this.storage.ref(n);
    const task = this.storage.upload(n, file);
    // observe percentage changes
    this.uploadPercent = task.percentageChanges();
    // get notified when the download URL is available
    task.snapshotChanges().pipe(
      finalize(() => this.downloadURL = fileRef.getDownloadURL())
    )
      .subscribe()
  }
//addEvent(){}
  
}
