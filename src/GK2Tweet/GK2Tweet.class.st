Class {
	#name : #GK2Tweet,
	#superclass : #Object,
	#instVars : [
		'tweet'
	],
	#category : #GK2Tweet
}

{ #category : #accessing }
GK2Tweet >> asString [
	^ 'status: ' , (self status) , String cr, 
	  'created-at: ', (self createdAt) , String cr,
	  'imgURL: ', (self imgURL) , String cr ,
	  'tweetURL: ', (self tweetURL) , String cr , 
	  String cr, 
	  'Dictionary: ' , (tweet asString)
]

{ #category : #accessing }
GK2Tweet >> createdAt [
	^ tweet at: 'created-at'
"	^ (ZTimestampFormat fromString: 'Sat Feb 03 16:05:06 +0000 2001')
		parse: (tweet at: 'created-at')"
]

{ #category : #accessing }
GK2Tweet >> gtPreviewColList: aView [
	<gtView>
	^ aView columnedList
		title: 'ColList' ;
		"items: [ self class instVarNames ]"
		"items: {1 . 4 } ;"
		items: { 'a1' -> 1 . 'a2' -> 3 } ;
		column: #Item 
			text: [ :item | item key] 
			width: 170;
		column: #Value 
"			text: [ :item | item value: self ]"
			text: [ :item |  item value ] 
"		send: [ :item | item value: self ]"
" how do I add image? "
		
]

{ #category : #accessing }
GK2Tweet >> gtPreviewHoriz: aView [
	<gtView>
	^ aView explicit
		title: 'TweetHoriz' translated;
		priority: 6;
		stencil: [
			| container text textContainer imgContainer imgSize |
			imgSize := 200@266.
			text := String streamContents: [ :stream |
			        stream
            		    nextPutAll: self status;		                
            		    nextPutAll: String cr;	        		        
            		    nextPutAll: (self createdAt)].
					
			container := BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent].

			textContainer := BrEditor new aptitude: BrGlamorousRegularEditorAptitude;
				constraintsDo: [ :c | 
					c horizontal matchParent ];
				margin: (BlInsets top: 5 right: 0 bottom: 20 left: 5);
				text: (text asRopedText glamorousRegularFont
					fontSize: 14;
					foreground: Color black).
			imgContainer := BlElement new
				size: imgSize;
				background: (self image scaledToSize: imgSize);
				margin: (BlInsets all: 10).
				
			container addChild: imgContainer.
			container addChild: textContainer.
			container.
			]
]

{ #category : #accessing }
GK2Tweet >> gtPreviewSimple: aView [
	<gtView>
	^ aView textEditor
		title: 'Simple';
		text: [ self asString asRopedText]
	
]

{ #category : #accessing }
GK2Tweet >> gtPreviewVert: aView [
	<gtView>
	^ aView explicit
		title: 'Tweet Vert' translated;
		priority: 6;
		stencil: [
			| container text textContainer imgContainer imgSize |

			" parent container "
			container := BlElement new
				layout: BlLinearLayout vertical;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent].
					
			imgSize := 200@266.
			text := self asString.
			
			textContainer := BrEditor new aptitude: BrGlamorousRegularEditorAptitude;
				constraintsDo: [ :c | 
					c horizontal matchParent ];
				margin: (BlInsets top: 5 right: 0 bottom: 20 left: 5);
				text: (text asRopedText glamorousRegularFont
					fontSize: 14;
					foreground: Color black).
			imgContainer := BlElement new
				size: imgSize;
				background: (self image scaledToSize: imgSize);
				margin: (BlInsets all: 10).
				
			container addChild: textContainer.
			container addChild: imgContainer.
			container.
			]
]

{ #category : #accessing }
GK2Tweet >> image [
    | bytes |
	bytes := ZnClient new url: (self imgURL) ; get.
	^ bytes readStreamDo: [:s | ImageReadWriter formFromStream: s ]
]

{ #category : #accessing }
GK2Tweet >> imgURL [
	^ (((tweet at: 'entities') at: 'media') first at: 'media_url'). 
]

{ #category : #accessing }
GK2Tweet >> status [
	 ^ tweet at: 'status'.
]

{ #category : #accessing }
GK2Tweet >> tweetURL [
	^ tweet at: 'url'
]

{ #category : #'instance creation' }
GK2Tweet >> with: json [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	tweet := json.
	
]
