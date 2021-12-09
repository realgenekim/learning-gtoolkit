Class {
	#name : #TweetExamples,
	#superclass : #Object,
	#category : #'GK2Tweet-GK2Tweet'
}

{ #category : #accessing }
TweetExamples >> createTweets [
	<gtExample>
	"This is a new method"
	| ts | 
	ts := GK2Tweets new file: '/tmp/tweets-sample.json'.
	ts createTweets.
	^ ts
	
]

{ #category : #accessing }
TweetExamples >> newMethod [
	"This is a new method"
]
