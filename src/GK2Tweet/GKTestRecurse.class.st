Class {
	#name : #GKTestRecurse,
	#superclass : #Object,
	#instVars : [
		'nodes'
	],
	#category : #GK2Tweet
}

{ #category : #accessing }
GKTestRecurse >> recurseSum [

	| fst rst ncopy sum |
	ncopy := nodes copy.
	fst := ncopy removeFirst.
	rst := ncopy.

	Transcript show: 'fst: ' , fst asString, String cr.
	Transcript show: 'rst: ' , rst asString, String cr.
	Transcript show: '==='.
	
	sum := self reduce: fst rst: rst acc: 0. 
	
	^sum.
]

{ #category : #accessing }
GKTestRecurse >> reduce [
]

{ #category : #accessing }
GKTestRecurse >> reduce: fst rst: rst [ 
]

{ #category : #accessing }
GKTestRecurse >> reduce: fst rst: rst acc: acc [

	" split fst and rst
	  add fst to accumulator, recurse with rst "

	| rcopy rfst nacc |
	" termination condition: isEmtpy "
	rst isEmpty
		ifTrue: [ ^ acc + fst ]
		ifFalse: [ 
			nacc := acc + fst.
			
			rcopy := rst copy.
			rfst := rcopy removeFirst.

			Transcript show: 'fst: ' , rfst asString , String cr.
			Transcript show: 'rst: ' , rcopy asString , String cr.
			Transcript show: 'acc: ' , nacc asString , String cr.
			Transcript show: '===' , String cr.


			^ self reduce: rfst rst: rcopy acc: nacc ]
]

{ #category : #accessing }
GKTestRecurse >> setNodes: aCollection [
	nodes := OrderedCollection new.
	nodes addAll: aCollection.
]
