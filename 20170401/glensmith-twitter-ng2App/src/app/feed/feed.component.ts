import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service'
import { FeedService } from '../feed.service';
import { Tweet } from '../tweet';

@Component({
  selector: 'app-feed',
  templateUrl: './feed.component.html',
  styleUrls: ['./feed.component.css']
})
export class FeedComponent implements OnInit {

  mytext = '';
  errorText = '';
  tweets = [];
  loaded = false;

  constructor(private userService: UserService, private feedService: FeedService) { }

  ngOnInit() {
    this.feedService.getCurrentFeed().subscribe((newTweets) => {
      this.tweets = newTweets;
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
  }

  isUserInCollection(collection: string[], userId: string): boolean {
    return collection.indexOf(userId) != -1;
  }

  OnFavorite(tweet) {
    this.feedService.favoriteTweet(tweet);
  }

  OnRetweet(tweet) {
    this.feedService.reTweet(tweet);
    this.feedService.updateTweet(tweet).subscribe(resp => {
      console.log("Response in component: ", resp);
    }, (error) => {
      this.errorText = error;
    });
  }

  OnNewTweet() {
    this.feedService.postNewTweet(this.mytext).subscribe((newTweet: Tweet) => {
      this.tweets.unshift(newTweet);
    }, (error) => {
      this.errorText = error;
    });
    this.mytext = '';
  }
}
