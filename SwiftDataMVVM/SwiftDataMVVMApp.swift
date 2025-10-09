//
//  SwiftDataMVVMApp.swift
//  SwiftDataMVVM
//
//  Created by Matteo Manferdini on 09/10/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataMVVMApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
		.modelContainer(ModelContainer.shared)
	}
}

extension ModelContainer {
	static let shared = ModelContainer.modelContainer(for: Item.self)

	static func modelContainer(
		for modelTypes: any PersistentModel.Type...,
		inMemory: Bool = false
	) -> ModelContainer {
		let schema = Schema(modelTypes)
		let modelConfiguration = ModelConfiguration(
			schema: schema,
			isStoredInMemoryOnly: inMemory
		)
		do {
			return try ModelContainer(
				for: schema,
				configurations: [modelConfiguration]
			)
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}
}
