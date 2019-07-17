import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../core/guards';


const routes: Routes = [
    {path: '', redirectTo: 'home', pathMatch: 'full'},
    // { path: 'home', loadChildren: './home/home.module#HomeModule', canActivate: [AuthGuard] },
    { path: 'home', loadChildren: './home/home.module#HomeModule', canActivate: [AuthGuard] },
    { path: 'auth', loadChildren: '../core/auth/auth.module#AuthModule' },
    { path: '**', redirectTo: 'home'}
    // otherwise redirect to home
    // { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
