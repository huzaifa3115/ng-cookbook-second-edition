import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';
import { appRoutes } from './app.routes';
import { NotificationsButtonComponent } from './notifications-button/notifications-button.component';
import { NotificationsManagerComponent } from './notifications-manager/notifications-manager.component';

@NgModule({
  declarations: [
    AppComponent,
    NotificationsButtonComponent,
    NotificationsManagerComponent,
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(appRoutes, { initialNavigation: 'enabledBlocking' }),
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
