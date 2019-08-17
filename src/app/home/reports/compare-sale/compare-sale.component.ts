import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ReportsService } from '../reports.service';

declare var $: any;

@Component({
  selector: 'app-compare-sale',
  templateUrl: './compare-sale.component.html',
  styleUrls: ['./compare-sale.component.scss']
})
export class CompareSaleComponent implements OnInit {

  @ViewChild('pfromdatepicker', {static: false}) pfromdatepicker: ElementRef;
  @ViewChild('ptodatepicker', {static: false}) ptodatepicker: ElementRef;
  @ViewChild('fromdatepicker', {static: false}) fromdatepicker: ElementRef;
  @ViewChild('todatepicker', {static: false}) todatepicker: ElementRef;

  constructor(public report: ReportsService) { }

  ngOnInit() {
    $(
      () => {
          $('#ptodatepicker').datepicker( {dateFormat : 'yy-mm-dd'});
          $('#pfromdatepicker').datepicker( {dateFormat : 'yy-mm-dd'});
          $('#todatepicker').datepicker( {dateFormat : 'yy-mm-dd'});
          $('#fromdatepicker').datepicker( {dateFormat : 'yy-mm-dd'});
      }
    );
  }

  filter() {
    const pfromdate = this.pfromdatepicker.nativeElement.value;
    const ptodate = this.ptodatepicker.nativeElement.value;
    const fromdate = this.fromdatepicker.nativeElement.value;
    const todate = this.todatepicker.nativeElement.value;
    const data = '&pfromdate=' + pfromdate + '&ptodate=' + ptodate + '&fromdate=' + fromdate + '&todate=' + todate;
    this.report.$compareSale = this.report.getCompareSaleReport(data);
    this.report.$compareSale.subscribe();
  }

  exportExcel() {
    $('#myTable').tableExport({formats: ['xls', 'csv', 'txt']} );
    $('.button-default.csv').click();
  }
}
