# Organize your twitter deletion

Luca Hammer has [written a wonderful set of tools][1] to delete your old tweets.

However, instead of handing over my entire list of tweets, I wanted a little bit of control over the tweets to be
deleted. Especially when you have a lot of tweets to be deleted (I have 13k tweets over last 16 years), there is a
small risk that your account can get blocked due to too many requests.

I especially wanted to manage the deletions by year. These are some really small scripts that Claude helped me whip up
to do so.

## Prerequisites

Grab the `tweet-headers.js` file from the Twitter archive as per the documentation in  Luca's tool and put it in the checkout directory of this repo.

Alternatively, if you are using Taskfile option below, just put the path to that js file in the `Taskfile.yaml` file.

## Count tweets by year

```shell-sessions
$ bash count_tweets.sh 
 475 2008
 836 2009
 424 2010
 371 2011
 444 2012
 278 2013
 305 2014
 634 2015
 795 2016
 869 2017
 590 2018
 907 2019
1085 2020
1723 2021
1435 2022
1472 2023
1082 2024
```

## Split tweets by year

```shell-session
$ bash split_tweets.sh
$ ls -1 *.js
tweet-headers.js
tweet_headers_2008.js
tweet_headers_2009.js
tweet_headers_2010.js
tweet_headers_2011.js
tweet_headers_2012.js
tweet_headers_2013.js
tweet_headers_2015.js
tweet_headers_2016.js
tweet_headers_2017.js
tweet_headers_2018.js
tweet_headers_2019.js
tweet_headers_2020.js
tweet_headers_2021.js
tweet_headers_2022.js
tweet_headers_2023.js
tweet_headers_2024.js
```

Now you can provide the tweets for a specific year to delete to Luca's tool.

[1]: https://github.com/lucahammer/tweetXer

## Taskfile

If you use [Taskfile](https://taskfile.dev), you can use the following tasks:

```shell-session
$ # Count
$ task count
...
$ # Split
$ task split
...
```
