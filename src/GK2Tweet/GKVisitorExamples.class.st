Class {
	#name : #GKVisitorExamples,
	#superclass : #Object,
	#category : #GK2Tweet
}

{ #category : #accessing }
GKVisitorExamples >> ast [
	<gtExample>
	| ast |
	ast := LeParser parse: 
	'#Header

Intro paragraph

##Header 2

Paragraph 2


###Header 3
###Header 4
# Header 1
`fixed size`
*italic*
**bold**'.

	^ast.
]

{ #category : #accessing }
GKVisitorExamples >> parsed [
	<gtExample>
	| v |
	v := GKHeaderVisitor new.
	v accept: self ast.


	self assert: v connections size = 5.
	self assert: v connections size = 5.

	v connections at: 1.
	^ v.
]
