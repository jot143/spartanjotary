import { Component, OnInit, Input} from '@angular/core';

@Component({
  selector: 'app-dropdown-tree',
  templateUrl: './dropdown-tree.component.html',
  styleUrls: ['./dropdown-tree.component.scss']
})
export class DropdownTreeComponent implements OnInit {
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
    console.log(target);
  }

}
