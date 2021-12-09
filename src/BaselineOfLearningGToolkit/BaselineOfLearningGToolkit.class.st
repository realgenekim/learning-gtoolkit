Class {
	#name : #BaselineOfLearningGToolkit,
	#superclass : #BaselineOf,
	#category : #BaselineOfLearningGToolkit
}

{ #category : #accessing }
BaselineOfLearningGToolkit >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'GK2Tweet'].
]
