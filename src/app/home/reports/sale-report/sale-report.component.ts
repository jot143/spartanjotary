import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ReportsService } from '../reports.service';

declare var $: any;
@Component({
  selector: 'app-sale-report',
  templateUrl: './sale-report.component.html',
  styleUrls: ['./sale-report.component.scss']
})
export class SaleReportComponent implements OnInit {

  @ViewChild('fromdatepicker', {static: false}) fromdatepicker: ElementRef;
  @ViewChild('todatepicker', {static: false}) todatepicker: ElementRef;

  constructor(public report: ReportsService) { }

  ngOnInit() {
    $(
      () => {
          $('#todatepicker').datepicker( {dateFormat : 'yy-mm-dd'});
          $('#fromdatepicker').datepicker( {dateFormat : 'yy-mm-dd'});
      }
    );
  }

  filter() {
    const fromdate = this.fromdatepicker.nativeElement.value;
    const todate = this.todatepicker.nativeElement.value;
    const data = '&fromdate=' + fromdate + '&todate=' + todate;
    this.report.$saleReport = this.report.getSaleReport(data);
    this.report.$saleReport.subscribe();
  }


  exportExcel(tableid) {
    $('#myTable' + tableid).tableExport({formats: ['xls', 'csv', 'txt']} );
    $('.button-default.csv').click();
    $('.button-default.csv').remove();
  }
}
