
import { AdminComponent } from './components/admin/admin.component';
import { NgModule, Component } from '@angular/core';
//import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard/dashboard.component';

const routes: Routes = [
  {path:'',component:AdminComponent},
  {path:'dashboard',component:DashboardComponent},
];

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forRoot(routes)
  ],
  exports: [
    RouterModule
  ]
})
export class AppRoutingModule { }
