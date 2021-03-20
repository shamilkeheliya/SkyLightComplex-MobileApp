import { ReportService } from './../../../services/report.service';
import { Report } from './../../../models/Report';
import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreDocument, AngularFirestoreCollection} from '@angular/fire/firestore';

@Component({
  selector: 'app-labors-reports',
  templateUrl: './labors-reports.component.html',
  styleUrls: ['./labors-reports.component.css']
})
export class LaborsReportsComponent implements OnInit {
  reports: Report[];
  reportsCollection: AngularFirestoreCollection<Report>;

  constructor(private reportService: ReportService, private afs: AngularFirestore) { }

  ngOnInit(): void {
    this.reportService.getReports().subscribe(reports =>{
      this.reports = reports;
    })
  }

}
