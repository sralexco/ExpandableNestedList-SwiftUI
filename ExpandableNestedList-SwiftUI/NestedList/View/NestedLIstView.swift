//
//  NestedLIstView.swift
//  ExpandableNestedList-SwiftUI
//
//  Created by alex on 6/03/25.
//

import SwiftUI

struct NestedLIstView: View {
    
    let items: [Item] = [
        Item(name: "1",
             children: [Item(name: "1.1", children: [Item(name: "1.1.1"), Item(name: "1.1.2")]),Item(name: "1.2")]),
        Item(name: "2",
             children: [Item(name: "2.1"),Item(name: "2.2")]),
        Item(name: "3",
             children: [Item(name: "3.1")]),
        Item(name: "4",
             children: [])
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ExpandableItem(item: item)
             }
        }
    }
}

struct ExpandableItem: View {
    let item:Item
    @State private var isExpanded = false
    
    var body: some View {
        if let children = item.children {
            DisclosureGroup(
                isExpanded: $isExpanded,
                content: {
                    ForEach(children, content: {child in
                        Text(child.name)
                            .padding(.leading, 20)
                    })
                }, label: {
                    Text(item.name)
                        .font(.headline)
                }
            )
        } else {
            Text(item.name)
                .font(.headline)
        }
    }
}

#Preview {
    NestedLIstView()
}
