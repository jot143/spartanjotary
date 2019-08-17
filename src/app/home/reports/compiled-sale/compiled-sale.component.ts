import { Component, OnInit, ViewChild, ElementRef, ChangeDetectorRef } from '@angular/core';
import { ReportsService } from '../reports.service';

declare var $: any;

@Component({
  selector: 'app-compiled-sale',
  templateUrl: './compiled-sale.component.html',
  styleUrls: ['./compiled-sale.component.scss']
})
export class CompiledSaleComponent implements OnInit {

  @ViewChild('fromdatepicker', {static: false}) fromdatepicker: ElementRef;
  @ViewChild('todatepicker', {static: false}) todatepicker: ElementRef;

  constructor(public report: ReportsService, public ref: ChangeDetectorRef) { }

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
    this.report.$compareSale = this.report.getCompileSaleReport(data);
    this.report.$compareSale.subscribe();
  }

  exportExcel() {
    $('#myTable').tableExport({formats: ['xls', 'csv', 'txt']} );
    $('.button-default.csv').click();
  }

}
