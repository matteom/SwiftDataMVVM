//
//  ViewModel.swift
//  SwiftDataMVVM
//
//  Created by Matteo Manferdini on 14/10/25.
//

import Foundation
import SwiftData

@Observable final class ViewModel: ContextReferencing {
	var items: [Item] = []
	private var modelContext: ModelContext?

	func update(with modelContext: ModelContext) {
		self.modelContext = modelContext
		items = (try? modelContext.fetch(FetchDescriptor())) ?? []
	}

	func addItem() {
		let newItem = Item(timestamp: Date())
		modelContext?.insert(newItem)
	}

	func deleteItems(offsets: IndexSet) {
		for index in offsets {
			modelContext?.delete(items[index])
		}
	}
}
