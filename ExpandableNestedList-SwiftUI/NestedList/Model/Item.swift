//
//  Item.swift
//  ExpandableNestedList-SwiftUI
//
//  Created by alex on 6/03/25.
//
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    var children: [Item]?
}
