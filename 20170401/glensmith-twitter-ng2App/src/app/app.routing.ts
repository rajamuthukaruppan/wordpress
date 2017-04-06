import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FeedComponent } from './feed/feed.component';
import { LoginComponent } from './login/login.component';
import { FriendsComponent } from './friends/friends.component';
import { FriendComponent } from './friend/friend.component';
import { MessagesComponent } from './messages/messages.component';

const appRoutes: Routes = [
  { path: '',  redirectTo: '/feed',  pathMatch: 'full'},
  { path: 'feed', component: FeedComponent },
  { path: 'login', component: LoginComponent },
  { path: 'friends', component: FriendsComponent },
  { path: 'messages', component: MessagesComponent },
  { path: 'friends/:friendId', component: FriendComponent}
];

export const appRoutingProviders: any[] = [

];

export const routing : ModuleWithProviders = RouterModule.forRoot(appRoutes); 