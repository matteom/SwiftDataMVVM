//
//  Item.swift
//  SwiftDataMVVM
//
//  Created by Matteo Manferdini on 09/10/25.
//

import Foundation
import SwiftData

@Model
final class Item {
	var timestamp: Date
	
	init(timestamp: Date) {
		self.timestamp = timestamp
	}
}
