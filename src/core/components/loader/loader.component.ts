import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { LoaderService } from './loader.service';

@Component({
  selector: 'app-loader',
  templateUrl: './loader.component.html',
  styleUrls: ['./loader.component.scss']
})
export class LoaderComponent implements OnInit, OnDestroy {
  private subscription: Subscription;
  message: any;
  constructor(private loaderService: LoaderService) { }

  ngOnInit() {
    this.subscription = this.loaderService.getMessage().subscribe(message => {
      if (message) {
        this.message = message;
      } else {
        this.message = undefined;
      }
    });
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

}
