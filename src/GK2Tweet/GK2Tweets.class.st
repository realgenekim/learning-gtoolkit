Class {
	#name : #GK2Tweets,
	#superclass : #Object,
	#instVars : [
		'tweets',
		'json'
	],
	#category : #GK2Tweet
}

{ #category : #accessing }
GK2Tweets >> createTweets [
	self with: json.
]

{ #category : #accessing }
GK2Tweets >> file: fname [
	| file stream |
	file := fname asFileReference.
	self assert:[file exists].
	stream := file readStream.
	json := STONJSON fromStream: stream. 
]

{ #category : #accessing }
GK2Tweets >> gtColumnedList [
	"This is a new method"
]

{ #category : #accessing }
GK2Tweets >> gtColumnedList: aView [
	<gtView>
	^ aView columnedList
		title: 'ColList';
		items: {'abc'. 'def'} 
]

{ #category : #accessing }
GK2Tweets >> gtPreviewHoriz: aView [
	<gtView>
	^ aView list
		title: 'Tweets Horiz';
		items: (self tweets) collect: [ :t | [t gtPreviewHoriz: aView ]]
]

{ #category : #accessing }
GK2Tweets >> gtPreviewSimple: aView [
	<gtView>
	^ aView list
		title: 'Tweets Simple';
		items: tweets
]

{ #category : #accessing }
GK2Tweets >> tweets [
	^ tweets
]

{ #category : #'instance creation' }
GK2Tweets >> with [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| |
	tweets := json collect: [:t | GK2Tweet new with: t].
]

{ #category : #'instance creation' }
GK2Tweets >> with: jsonin [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| |
	tweets := jsonin collect: [:t | GK2Tweet new with: t].
]
