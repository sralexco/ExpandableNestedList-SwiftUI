//
//  ExpandableRow.swift
//  ExpandableNestedList-SwiftUI
//
//  Created by alex on 6/03/25.
//

import SwiftUI

struct ExpandableRow: View {
    let item:Item
    @State private var isExpanded = false
    
    var body: some View {
        if let children = item.children, !children.isEmpty {
            DisclosureGroup(
                isExpanded: $isExpanded,
                content: {
                    ForEach(children, content: {child in
                        ExpandableRow(item:child)
                            .padding(.leading, 10)
                    })
                },label: {
                    Text(item.name)
                        .font(.footnote)
                }
            )
        } else {
            Text(item.name)
                .font(.footnote)
        }
    }
}

/* #Preview {
    ExpandableRow()
} */


