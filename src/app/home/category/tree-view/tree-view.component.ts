import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-tree-view',
  templateUrl: './tree-view.component.html',
  styleUrls: ['./tree-view.component.scss']
})
export class TreeViewComponent implements OnInit {
  @Input() treeData: [];
  constructor() { }

  ngOnInit() {
  }

  expandChild(event) {
    const target = event.target || event.srcElement || event.currentTarget;
    target.classList.toggle('active');
    const panel = target.nextElementSibling;
    if (panel.style.display === 'block') {
      panel.style.display = 'none';
    } else {
      panel.style.display = 'block';
    }
    console.log(target);
  }
}
