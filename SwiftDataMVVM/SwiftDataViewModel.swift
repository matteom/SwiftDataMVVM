//
//  SwiftDataViewModel.swift
//  SwiftDataMVVM
//
//  Created by Matteo Manferdini on 15/10/25.
//

import SwiftData
import SwiftUI

protocol ContextReferencing {
	init()
	func update(with modelContext: ModelContext)
}

@propertyWrapper struct SwiftDataViewModel<VM: ContextReferencing>: DynamicProperty {
	@State var viewModel = VM()
	@Environment(\.modelContext) private var modelContext

	var wrappedValue: VM {
		return viewModel
	}

	func update() {
		viewModel.update(with: modelContext)
	}
}
