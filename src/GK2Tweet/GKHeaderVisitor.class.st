Class {
	#name : #GKHeaderVisitor,
	#superclass : #LeContentNodeVisitor,
	#instVars : [
		'headers',
		'stack'
	],
	#category : #GK2Tweet
}

{ #category : #accessing }
GKHeaderVisitor >> gtHeadersFor: aView [
  <gtView>
   ^ aView list 
     title: 'Headers';
     items: [headers]
]

{ #category : #accessing }
GKHeaderVisitor >> initialize [
	super initialize.
	headers := OrderedCollection new.
]

{ #category : #accessing }
GKHeaderVisitor >> visitHeader: aHeader [

	super visitHeader: aHeader.

	headers add: aHeader.

	[ aHeader headerLevel > stack top headerLevel ] whileTrue: [ 
		stack pop ]
]
