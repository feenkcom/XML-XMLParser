Class {
	#name : #BaselineOfXMLParserForGlamorousToolkit,
	#superclass : #BaselineOf,
	#category : #BaselineOfXMLParserForGlamorousToolkit
}

{ #category : #baseline }
BaselineOfXMLParserForGlamorousToolkit >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'BitmapCharacterSet' with: [
				spec repository: 'github://pharo-contributions/BitmapCharacterSet:62ee106d7960646fa5b85577fe83f920a6bb6672/src' ].
		spec
			baseline: 'OrderPreservingDictionary' with: [
				spec repository: 'github://pharo-contributions/OrderPreservingDictionary:7b3ab363379e35a3e0e0183b6c2d193a675f898f/src' ].
		spec
			baseline: 'XMLWriterForGlamorousToolkit' with: [
				spec repository: 'github://feenkcom/XML-XMLWriter:v0.6.2/src' ].

		spec package: 'XML-Parser' with: [
			spec requires: #('OrderPreservingDictionary' 'BitmapCharacterSet') ].
		spec package: 'XML-Parser-Tests' with: [
			spec requires: #('XML-Parser' 'OrderPreservingDictionary' 'BitmapCharacterSet') ].
		spec package: 'XML-Parser-Tests-Conformance' with: [
			spec requires: #('XML-Parser' 'XMLWriterForGlamorousToolkit' 'XML-Parser-Tests') ].
		spec package: 'XML-Parser-Tools' with: [
			spec requires: #('XMLWriterForGlamorousToolkit' 'XML-Parser') ].
	]
]
