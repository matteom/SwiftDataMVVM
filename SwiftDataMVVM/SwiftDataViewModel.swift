//
//  SwiftDataViewModel.swift
//  SwiftDataMVVM
//
//  Created by Matteo Manferdini on 15/10/25.
//

import SwiftData
import SwiftUI

protocol ContextReferencing {
	init(modelContext: ModelContext)
	func update()
}

@propertyWrapper struct SwiftDataViewModel<VM: ContextReferencing>: DynamicProperty {
	@State var viewModel: VM!
	@Environment(\.modelContext) private var modelContext

	var wrappedValue: VM {
		return viewModel
	}

	mutating func update() {
		if viewModel == nil {
			_viewModel = State(initialValue: VM(modelContext: modelContext))
		}
		viewModel.update()
	}
}
