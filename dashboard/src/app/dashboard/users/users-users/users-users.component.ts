import { User } from './../../../models/User';
import { UserService } from './../../../services/user.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-users-users',
  templateUrl: './users-users.component.html',
  styleUrls: ['./users-users.component.css']
})
export class UsersUsersComponent implements OnInit {
  users: User[];

  constructor(private userService: UserService) { }

  ngOnInit(): void {
    this.userService.getUsers().subscribe(users => {
      this.users = users;
    })
  }

}
