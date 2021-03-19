import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-notifications-fixed',
  templateUrl: './notifications-fixed.component.html',
  styleUrls: ['./notifications-fixed.component.css']
})
export class NotificationsFixedComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  
  water(){}
  electric(){}
  emergency(){}

}
