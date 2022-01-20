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
'#Header111

Intro paragraph 123

Intro paragraph 123

Second paragraph 234

##Header 2

Paragraph 2

###Header 3

Paragraph 3 

###Header 4

Paragraph 4a

Paragraph 4b

# Header 1
`fixed size`
*italic*
**bold**'.

	^ast. 
]

{ #category : #accessing }
GKVisitorExamples >> handleDuplicateName [
	<gtExample>
	| ast v |
	ast := LeParser parse: 
'#Header111

Intro paragraph 123

Intro paragraph 123'.

	v := GKHeaderVisitor new.
	v accept: ast.
	
	^ v.
	" self assert: v connections size = 2."
]

{ #category : #accessing }
GKVisitorExamples >> parsed [ 
	<gtExample>
	| v nTexts |
	v := GKHeaderVisitor new.
	v accept: self ast.


	" split these up "
	self assert: v connections size = 14
		description: (v connections size asString).
	self assert: v headers size = 6
		description: (v headers size asString).
		
	nTexts := v textNodes size.
	self assert: nTexts = 9
		description: 'nTexts: ' , (nTexts asString).

	v connections at: 1.
	^ v.
]

{ #category : #accessing }
GKVisitorExamples >> runMondian [
	<gtExample>
	| v |
	v := GKHeaderVisitor new.
	v accept: self ast.
	^ v mondrian.
]

{ #category : #accessing }
GKVisitorExamples >> runTests [
	<gtExample>
	self parsed.
]
