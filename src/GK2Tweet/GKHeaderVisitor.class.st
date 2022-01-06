Class {
	#name : #GKHeaderVisitor,
	#superclass : #LeContentNodeVisitor,
	#instVars : [
		'headers',
		'stack',
		'connections'
	],
	#category : #GK2Tweet
}

{ #category : #accessing }
GKHeaderVisitor >> connections [
	^connections.
]

{ #category : #accessing }
GKHeaderVisitor >> gtHeadersFor: aView [
  <gtView>
   ^ aView list 
     title: 'Headers';
     items: [headers]
]

{ #category : #accessing }
GKHeaderVisitor >> headers [
	^headers.
]

{ #category : #accessing }
GKHeaderVisitor >> initialize [
	super initialize.
	headers := OrderedCollection new.
	stack := Stack new.
	stack push: LeHeaderNode new.
	connections := OrderedCollection new.
	
]

{ #category : #accessing }
GKHeaderVisitor >> visitHeader: aHeader [

	super visitHeader: aHeader.

	headers add: aHeader.

	[ aHeader headerLevel > stack top headerLevel ] whileFalse: [ 
		stack pop ].
		
	connections add: stack top -> aHeader .
	stack push: aHeader.
	
		
]
