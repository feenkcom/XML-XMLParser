"
This is a base class for attribute validators.
"
Class {
	#name : #XMLAttributeValidator,
	#superclass : #Object,
	#instVars : [
		'element',
		'name',
		'defaultValue',
		'defaultPragma'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #'instance creation' }
XMLAttributeValidator class >> element: anElement name: aName defaultPragma: aPragma defaultValue: aValue [
	^ self new
		setElement: anElement
		name: aName
		defaultPragma: aPragma
		defaultValue: aValue
]

{ #category : #normalization }
XMLAttributeValidator >> furtherNormalizeValueIn: anAttributeDictionary [
	| readStream writeStream |

	readStream := (anAttributeDictionary at: name) readStream.
	writeStream := (String new: readStream size) writeStream.
	readStream skipSeparators.
	[readStream atEnd]
		whileFalse: [
			readStream peek isSeparator
				ifTrue: [
					readStream skipSeparators.
					readStream atEnd
						ifFalse: [writeStream nextPut: Character space]]
				ifFalse: [writeStream nextPut: readStream next]].
	anAttributeDictionary
		at: name
		put: writeStream contents.
]

{ #category : #testing }
XMLAttributeValidator >> isEntityValidator [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isEnumerationValidator [
	^ false
]

{ #category : #initialization }
XMLAttributeValidator >> setElement: anElement name: aName defaultPragma: aPragma defaultValue: aValue [
	element := anElement.
	name := aName.
	defaultPragma := aPragma.
	defaultValue := aValue.
]

{ #category : #testing }
XMLAttributeValidator >> shouldFurtherNormalizeValue [
	^ true
]

{ #category : #validation }
XMLAttributeValidator >> validateAttributes: anAttributeDictionary [

]

{ #category : #validation }
XMLAttributeValidator >> validateDefaultValueIn: anAttributeDictionary [
	defaultPragma == #REQUIRED
		ifTrue: [
			(anAttributeDictionary includesKey: name)
				ifFalse: [XMLValidationException signal: 'Required attribute "', name, '" is missing']]
		ifFalse: [
			defaultPragma == #IMPLIED
				ifTrue: [anAttributeDictionary at: name ifAbsentPut: ['']]
				ifFalse: [
					defaultPragma == #FIXED
						ifTrue: [anAttributeDictionary at: name put: defaultValue]
						ifFalse: [
							((anAttributeDictionary at: name ifAbsent: ['']) isEmpty 
								and: [defaultValue notEmpty])
								ifTrue: [anAttributeDictionary at: name put: defaultValue]]]].

	(self shouldFurtherNormalizeValue and: [anAttributeDictionary includesKey: name])
		ifTrue: [self furtherNormalizeValueIn: anAttributeDictionary].
]

{ #category : #validation }
XMLAttributeValidator >> validateID: anId [
	(XMLTokenizer isName: anId)
		ifFalse: [XMLValidationException signal: 'Invalid ID ', anId, ' in attribute "', name, '"']
]

{ #category : #validation }
XMLAttributeValidator >> validateName: aName [
	(XMLTokenizer isNmtoken: aName)
		ifFalse: [XMLValidationException signal: 'Invalid name "', name, '" in attribute "', name, '"']
]