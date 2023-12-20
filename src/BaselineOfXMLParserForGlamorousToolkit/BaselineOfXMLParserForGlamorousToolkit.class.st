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
				spec repository: 'github://pharo-contributions/BitmapCharacterSet:9209847b7be64c7deb82731291cfba6d1554686b/src' ].
		spec
			baseline: 'OrderPreservingDictionary' with: [
				spec repository: 'github://pharo-contributions/OrderPreservingDictionary:7803689056b52a9069940c3600bece878bec88c9/src' ].
		spec
			baseline: 'XMLWriterForGlamorousToolkit' with: [
				spec repository: 'github://feenkcom/XML-XMLWriter:v0.6.1/src' ].

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
