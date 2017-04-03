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

  tweets = [];

  constructor(private userService: UserService, private feedService: FeedService) { }

  ngOnInit() {
    this.feedService.getCurrentFeed().subscribe((newTweets) => {
      this.tweets = newTweets;
    });
    // this.tweets = this.feedService.getCurrentFeed();

  }

  isUserInCollection(collection: string[], userId: string): boolean {
    return collection.indexOf(userId) != -1;
  }

  OnFavorite(tweet) {
    this.feedService.favoriteTweet(tweet);
  }

  OnRetweet(tweet) {
    this.feedService.reTweet(tweet);
  }

  OnNewTweet() {
    this.feedService.postNewTweet(this.mytext).subscribe((newTweet: Tweet) => {
      this.tweets.unshift(newTweet);
    });
    this.mytext = '';
  }
}
