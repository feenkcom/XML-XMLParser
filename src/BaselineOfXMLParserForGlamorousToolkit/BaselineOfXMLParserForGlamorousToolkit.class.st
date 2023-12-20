Class {
	#name : #BaselineOfXMLParserForGlamorousToolkit,
	#superclass : #BaselineOf,
	#category : #BaselineOfXMLParserForGlamorousToolkit
}

{ #category : #baselines }
BaselineOfXMLParserForGlamorousToolkit >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
	
			"Prerequisite Projects"			
			spec
				baseline: 'BitmapCharacterSet' with: [ 
					spec
						repository: 'github://pharo-contributions/BitmapCharacterSet/src' ];
				baseline: 'OrderPreservingDictionary' with: [ 
					spec
						repository: 'github://pharo-contributions/OrderPreservingDictionary/src' ];
				baseline: 'XMLWriterForGlamorousToolkit' with: [ 
					spec
						repository: 'github://feenkcom/XML-XMLWriter:gt/src' ].

		"Packages"
		spec
			package: 'XML-Parser' with: [
				spec requires: #( 'OrderPreservingDictionary' 'BitmapCharacterSet' ) ];
			package: 'XML-Parser-Tests' with: [
				spec requires: #( 'XML-Parser' 'OrderPreservingDictionary'  'BitmapCharacterSet' ) ];
			package: 'XML-Parser-Tests-Conformance' with: [
				spec requires: #( 'XML-Parser' 'XMLWriterForGlamorousToolkit' 'XML-Parser-Tests' ) ];
			package: 'XML-Parser-Tools' with: [ 
				spec requires: #( 'XMLWriterForGlamorousToolkit' 'XML-Parser' ) ] ]
]
