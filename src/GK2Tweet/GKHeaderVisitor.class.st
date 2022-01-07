Class {
	#name : #GKHeaderVisitor,
	#superclass : #LeContentNodeVisitor,
	#instVars : [
		'headers',
		'stack',
		'connections',
		'textNodes'
	],
	#category : #GK2Tweet
}

{ #category : #accessing }
GKHeaderVisitor >> connections [
	^connections.
]

{ #category : #accessing }
GKHeaderVisitor >> grTextNodesFor: aView [
  <gtView>
   ^ aView list 
     title: 'TextNodes';
     items: [textNodes]
]

{ #category : #accessing }
GKHeaderVisitor >> gtEdgesConnectionsFor: aView [
  <gtView>
   ^ aView list 
     title: 'Edges';
     items: [connections]
]

{ #category : #accessing }
GKHeaderVisitor >> gtGraph [
	| m |

	^m.
	
]

{ #category : #accessing }
GKHeaderVisitor >> gtGraph: aView [

	<gtView>
	| m |
	m := self mondrian.
	^ aView explicit
		  title: 'Graph';
		  stencil: [ m asElement ]
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
	
	headers add: stack top.
	connections := OrderedCollection new.
	
	textNodes := OrderedCollection new.
	
]

{ #category : #accessing }
GKHeaderVisitor >> mondrian [
	| m |
	
	m := GtMondrian new.
	m nodes with: self headers.
	m nodes 
		shape: 
			[ :x | (BlElement new 
				border: (BlBorder paint: Color red);
				geometry: BlEllipseGeometry new; 
					size: 8 @8 )] ;
		with: self textNodes.
	m edges connectAssociations: self connections.
	m layout radialTree.
	^m
]

{ #category : #accessing }
GKHeaderVisitor >> textNodes [
	^ textNodes.
]

{ #category : #accessing }
GKHeaderVisitor >> visitHeader: aHeader [

	super visitHeader: aHeader.

	headers add: aHeader.

	[ aHeader headerLevel > stack top headerLevel ] whileFalse: [ 
		stack pop ].

	connections add: stack top -> aHeader.
	stack push: aHeader
]

{ #category : #accessing }
GKHeaderVisitor >> visitText: aText [

	super visitText: aText.
	
	((aText parent isMemberOf: LeHeaderNode) not)
	& (aText startPosition ~= aText stopPosition) ifTrue: [ 
		self textNodes add: aText.
		self connections add: stack top -> aText.
		]
]

{ #category : #accessing }
GKHeaderVisitor >> xx [
	| m |
	^m.
	
]
