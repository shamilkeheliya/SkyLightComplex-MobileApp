import { environment } from './../environments/environment';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { AppComponent } from './app.component';
import { AngularFireModule } from '@angular/fire';
import { AngularFirestoreModule } from '@angular/fire/firestore';
import { MatSnackBarModule} from '@angular/material/snack-bar';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatFormFieldModule} from '@angular/material/form-field';
import { MatInputModule} from '@angular/material/input';
import { AdminComponent } from './components/admin/admin.component';
import { DashboardComponent } from './dashboard/dashboard/dashboard.component';
import { AppRoutingModule } from './app-routing.module';
import {MatTabsModule} from '@angular/material/tabs';
import { FeedComponent } from './dashboard/feed/feed/feed.component';
import { FeedGenaralComponent } from './dashboard/feed/feed-genaral/feed-genaral.component';
import { FeedSpecialComponent } from './dashboard/feed/feed-special/feed-special.component';
import { FeedAddeventComponent } from './dashboard/feed/feed-addevent/feed-addevent.component';
import { UsersComponent } from './dashboard/users/users/users.component';
import { UsersUsersComponent } from './dashboard/users/users-users/users-users.component';
import { UsersAdduserComponent } from './dashboard/users/users-adduser/users-adduser.component';
import { LaborsComponent } from './dashboard/labors/labors/labors.component';
import { LaborsLaborsComponent } from './dashboard/labors/labors-labors/labors-labors.component';
import { LaborsAddlaborComponent } from './dashboard/labors/labors-addlabor/labors-addlabor.component';
import { LaborsHiringComponent } from './dashboard/labors/labors-hiring/labors-hiring.component';
import { LaborsReportsComponent } from './dashboard/labors/labors-reports/labors-reports.component';


@NgModule({
  declarations: [
    AppComponent,
    AdminComponent,
    DashboardComponent,
    FeedComponent,
    FeedGenaralComponent,
    FeedSpecialComponent,
    FeedAddeventComponent,
    UsersComponent,
    UsersUsersComponent,
    UsersAdduserComponent,
    LaborsComponent,
    LaborsLaborsComponent,
    LaborsAddlaborComponent,
    LaborsHiringComponent,
    LaborsReportsComponent
  ],
  imports: [
    BrowserModule,
    MatTabsModule,
    AngularFireModule.initializeApp(environment.firebase),
    AngularFirestoreModule,
    MatSnackBarModule,
    BrowserAnimationsModule,
    MatFormFieldModule,
    MatInputModule,
    ReactiveFormsModule,
    AppRoutingModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
