//
//  SwiftDataMVVMTests.swift
//  SwiftDataMVVMTests
//
//  Created by Matteo Manferdini on 09/10/25.
//

import Testing
import SwiftData
@testable import SwiftDataMVVM

@Test func viewModelInsert() async throws {
	let container = ModelContainer.modelContainer(for: Item.self, inMemory: true)
	let context = container.mainContext
	let viewModel = ViewModel(modelContext: context)
	viewModel.addItem()
	let items: [Item] = try context.fetch(.init())
	#expect(items.count == 1)
}
