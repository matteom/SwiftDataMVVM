//
//  ContentView.swift
//  SwiftDataMVVM
//
//  Created by Matteo Manferdini on 09/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) private var modelContext
	@Query private var items: [Item]
	@SwiftDataViewModel private var viewModel: ViewModel

	var body: some View {
		NavigationSplitView {
			List {
				ForEach(viewModel.items) { item in
					NavigationLink {
						Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
					} label: {
						Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
					}
				}
				.onDelete(perform: deleteItems)
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					EditButton()
				}
				ToolbarItem {
					Button(action: addItem) {
						Label("Add Item", systemImage: "plus")
					}
				}
			}
		} detail: {
			Text("Select an item")
		}
	}

	private func addItem() {
		withAnimation {
			viewModel.addItem()
		}
	}

	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			viewModel.deleteItems(offsets: offsets)
		}
	}
}

#Preview {
	ContentView()
		.modelContainer(for: Item.self, inMemory: true)
}
