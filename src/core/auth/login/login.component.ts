import { Component, OnInit } from '@angular/core';
import { UserService, AuthenticationService } from 'src/core/services';
import { AlertService, LoaderService } from 'src/core/components';
import { validateEmail } from 'src/core/services';
import { RouterStateSnapshot, Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  user: {
    email: string,
    password: string
  } = {
      email: '',
      password: ''
    };
  constructor(
    public authService: AuthenticationService,
    public alertService: AlertService,
    public loaderService: LoaderService,
    private router: Router) { }

  ngOnInit() {
  }

  login() {
    console.log('login', this.user);

    if (this.user.email.length === 0) {
      return this.alertService.error('Please fill email');
    }

    if (this.user.password.length === 0) {
      return this.alertService.error('Please fill password');
    }

    if (validateEmail(this.user.email) === false) {
      return this.alertService.error('Please fill email');
    }
    this.loaderService.start('Please Wait...', true);
    this.authService.login(this.user).subscribe((res: any) => {
      this.loaderService.dismiss();
      console.log('login response', res);
      if (res.status === 'success') {
        this.alertService.success(res.message, true);
        this.router.navigate(['home']);
        return;
      }

      this.alertService.error(res.message);
      return false;
    }, (error) => {
      this.loaderService.dismiss();
      this.alertService.error('Backend or Internet Connection Problem');
      console.log(error);
    });

  }

}
