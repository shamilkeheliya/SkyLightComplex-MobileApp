import { UserService } from './services/user.service';
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
import { MatTabsModule } from '@angular/material/tabs';
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
import { BookingsComponent } from './dashboard/bookings/bookings/bookings.component';
import { BookingsNewComponent } from './dashboard/bookings/bookings-new/bookings-new.component';
import { BookingsAcceptedComponent } from './dashboard/bookings/bookings-accepted/bookings-accepted.component';
import { BookingsDeclinedComponent } from './dashboard/bookings/bookings-declined/bookings-declined.component';
import { RequestsComponent } from './dashboard/requests/requests/requests.component';
import { RequestsNewComponent } from './dashboard/requests/requests-new/requests-new.component';
import { RequestsReadComponent } from './dashboard/requests/requests-read/requests-read.component';
import { RequestsCompletedComponent } from './dashboard/requests/requests-completed/requests-completed.component';
import { ComplainsComponent } from './dashboard/complains/complains/complains.component';
import { ComplainsNewComponent } from './dashboard/complains/complains-new/complains-new.component';
import { ComplainsReadComponent } from './dashboard/complains/complains-read/complains-read.component';
import { NotificationsComponent } from './dashboard/notifications/notifications/notifications.component';
import { NotificationsFixedComponent } from './dashboard/notifications/notifications-fixed/notifications-fixed.component';
import { NotificationsMessageComponent } from './dashboard/notifications/notifications-message/notifications-message.component';
import { ContactusComponent } from './dashboard/contactus/contactus/contactus.component';
import { ContactusNewComponent } from './dashboard/contactus/contactus-new/contactus-new.component';
import { ContactusReadComponent } from './dashboard/contactus/contactus-read/contactus-read.component';
import { ContactusNumbersComponent } from './dashboard/contactus/contactus-numbers/contactus-numbers.component';
import {MatCardModule} from '@angular/material/card';
import { AngularFireAuth, AngularFireAuthModule } from '@angular/fire/auth';
import {MatTableModule} from '@angular/material/table';
import {MatButtonModule} from '@angular/material/button';


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
    LaborsReportsComponent,
    BookingsComponent,
    BookingsNewComponent,
    BookingsAcceptedComponent,
    BookingsDeclinedComponent,
    RequestsComponent,
    RequestsNewComponent,
    RequestsReadComponent,
    RequestsCompletedComponent,
    ComplainsComponent,
    ComplainsNewComponent,
    ComplainsReadComponent,
    NotificationsComponent,
    NotificationsFixedComponent,
    NotificationsMessageComponent,
    ContactusComponent,
    ContactusNewComponent,
    ContactusReadComponent,
    ContactusNumbersComponent,
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
    MatCardModule,
    AngularFireAuthModule,
    MatTableModule,
    MatButtonModule
  ],
  providers: [UserService],
  bootstrap: [AppComponent]
})
export class AppModule { }
