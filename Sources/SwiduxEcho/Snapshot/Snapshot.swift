//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import Foundation

// The following implementation is largely taken from [pointfreeco/swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing) library (SnapshotTesting/Snapshotting/Any.swift).
//
// The only modification that has been made is to hide closures in the snapshot.

func snap<T>(_ value: T, name: String? = nil, indent: Int = 0) -> String {
    let indentation = String(repeating: " ", count: indent)
    let mirror = Mirror(reflecting: value)
    var children = mirror.children
    let count = children.count
    let bullet = count == 0 ? "-" : "▿"

    let description: String
    switch (value, mirror.displayStyle) {
    case (_, .collection?):
        description = count == 1 ? "1 element" : "\(count) elements"
    case (_, .dictionary?):
        description = count == 1 ? "1 key/value pair" : "\(count) key/value pairs"
        children = sort(children)
    case (_, .set?):
        description = count == 1 ? "1 member" : "\(count) members"
        children = sort(children)
    case (_, .tuple?):
        description = count == 1 ? "(1 element)" : "(\(count) elements)"
    case (_, .optional?):
        let subjectType = String(describing: mirror.subjectType)
            .replacingOccurrences(of: " #\\d+", with: "", options: .regularExpression)
        description = count == 0 ? "\(subjectType).none" : "\(subjectType)"
        // Optional closures don't need to appear in the snapshot
        guard !subjectType.contains("->") else { return "" }
    case (let value as AnySnapshotStringConvertible, _) where type(of: value).renderChildren:
        description = value.snapshotDescription
    case (let value as AnySnapshotStringConvertible, _):
        return "\(indentation)- \(name.map { "\($0): " } ?? "")\(value.snapshotDescription)\n"
    case (let value as CustomStringConvertible, _):
        description = value.description
    case (_, .class?), (_, .struct?):
        description = String(describing: mirror.subjectType)
            .replacingOccurrences(of: " #\\d+", with: "", options: .regularExpression)
        children = sort(children)
    case (_, .enum?):
        let subjectType = String(describing: mirror.subjectType)
            .replacingOccurrences(of: " #\\d+", with: "", options: .regularExpression)
        description = count == 0 ? "\(subjectType).\(value)" : "\(subjectType)"
    case (let value, _):
        description = String(describing: value)
        // Closures don't need to appear in the snapshot
        guard description != "(Function)" else { return "" }
    }

    let lines = ["\(indentation)\(bullet) \(name.map { "\($0): " } ?? "")\(description)\n"]
        + children.map { snap($1, name: $0, indent: indent + 2) }

    return lines.joined()
}

private func sort(_ children: Mirror.Children) -> Mirror.Children {
    return .init(children.sorted { snap($0) < snap($1) })
}
