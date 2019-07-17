import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-form-builder',
  templateUrl: './form-builder.component.html',
  styleUrls: ['./form-builder.component.scss']
})
export class FormBuilderComponent implements OnInit {
  @Input() formData: any;
  constructor() { }

  ngOnInit() {
    console.log(this.formData);
  }

}
