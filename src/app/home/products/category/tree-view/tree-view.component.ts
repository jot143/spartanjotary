import { Component, OnInit, Input, ViewEncapsulation } from '@angular/core';

@Component({
  selector: 'app-tree-view',
  templateUrl: './tree-view.component.html',
  styleUrls: ['./tree-view.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class TreeViewComponent implements OnInit {
  @Input() treeData: [];
  @Input() callback: any;
  constructor() { }

  ngOnInit() {
  }

  expandChild(event) {
    const target = event.target || event.srcElement || event.currentTarget;
    target.classList.toggle('active');
    const panel = target.nextElementSibling.nextElementSibling;
    if (panel.style.display === 'block') {
      panel.style.display = 'none';
    } else {
      panel.style.display = 'block';
    }
  }
}
