
CREATE TABLE `tweet` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`body` VARCHAR(255) NULL DEFAULT NULL,
	`author` VARCHAR(50) NULL DEFAULT NULL,
	`date` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=33
;

CREATE TABLE `tweet_favorites` (
	`tweet_id` INT(11) NOT NULL,
	`user_id` INT(11) NOT NULL,
	PRIMARY KEY (`tweet_id`, `user_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tweet_retweets` (
	`tweet_id` INT(11) NOT NULL,
	`user_id` INT(11) NOT NULL,
	PRIMARY KEY (`tweet_id`, `user_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `tweet_users` (
	`user_id` INT(11) NOT NULL,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`user_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


-- Initial data containing tweets
insert into tweet values (2, "Measuring programming progress by lines of code is like measuring aircraft building progress by weight", "Joe", current_timestamp)
insert into tweet values (3, "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.", "Mary", current_timestamp)
insert into tweet values (4, "People think that computer science is the art of geniuses but the actual reality is the opposite, just many people doing things that build on each other, like a wall of mini stones.", "Glen", current_timestamp)
insert into tweet values (5, "You can’t have great software without a great team, and most software teams behave like dysfunctional families.", "Joe", current_timestamp)



select * from tweet

delete from tweet where id > 5

