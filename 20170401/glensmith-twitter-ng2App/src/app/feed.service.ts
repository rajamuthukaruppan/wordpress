import { Injectable } from '@angular/core';
import { UserService } from './user.service';
import { Tweet } from './tweet';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { Headers, RequestOptions } from '@angular/http';

@Injectable()
export class FeedService {

  tweets = []

  constructor(private userService: UserService, private http: Http) { }

  getCurrentFeed(): Observable<Tweet[]> {
    return this.http.get('http://localhost:8080/glensmith-twitter-service/rest/tweets').map((resp: Response) => {
      var fetchedTweets = [];
      for (let tweet of resp.json()) {
        fetchedTweets.push(this.getTweetFromJson(tweet));
      }
      return fetchedTweets as Array<Tweet>;
    }).catch(this.errorHandler);
  }

  errorHandler(err) {
    console.log(err);
    return Observable.throw(err); 
  }

  updateTweet(tweet: Tweet) {
    let body = JSON.stringify(tweet);
    let url = 'http://localhost:8080/glensmith-twitter-service/rest/tweet';
    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });
    
    return this.http.put(url, body, options).map(
      (resp : Response) => {
        if (resp.status == 204) {
          console.log("Success. Yay!");
        } else {
        throw `Error saving tweet ${tweet.id}. Received status code: ${resp.status}`;
      }
      return resp;
      });
  }
  private isUserInCollection(collection: string[], userId: string): boolean {
    return collection.indexOf(userId) != -1;
  }

  postNewTweet(tweetText: string) : Observable<Tweet> {
    let body = JSON.stringify({
      body: tweetText, author: this.userService.getCurrentUser(),
      date: new Date(), retweets: [], favorites: []
    });

    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });

    return this.http.post('http://localhost:8080/glensmith-twitter-service/rest/tweets', body, options).map(
      (resp: Response) => {
        return this.getTweetFromJson(resp.json());
      });
  }
  private getTweetFromJson(obj: Tweet): Tweet {
    return new Tweet(obj.id, obj.body, obj.author, obj.date, obj.retweets, obj.favorites);
  }
  reTweet(tweet: Tweet) {
    if (!this.isUserInCollection(tweet.retweets, this.userService.getCurrentUser())) {
      tweet.retweets.push(this.userService.getCurrentUser());
    }
    console.log("this ran");
    
  }

  favoriteTweet(tweet: Tweet) {
    if (!this.isUserInCollection(tweet.favorites, this.userService.getCurrentUser())) {
      tweet.favorites.push(this.userService.getCurrentUser());
    }
    console.log("this ran");
    
  }

  getFriends(): Observable<string[]> {
    return this.http.get(`http://localhost:8080/glensmith-twitter-service/rest/friends/${this.userService.getCurrentUser()}`).map((resp: Response) => resp.json() as string[]);
  }
}
