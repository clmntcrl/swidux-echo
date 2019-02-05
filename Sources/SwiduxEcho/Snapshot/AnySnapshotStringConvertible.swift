//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import Foundation

// The following implementation is taken from [pointfreeco/swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing) library (SnapshotTesting/Snapshotting/Any.swift).

/// A type with a customized snapshot dump representation.
///
/// Types that conform to the `AnySnapshotStringConvertible` protocol can provide their own representation to be used when converting an instance to a `dump`-based snapshot.
public protocol AnySnapshotStringConvertible {
    /// Whether or not to dump child nodes (defaults to `false`).
    static var renderChildren: Bool { get }

    /// A textual snapshot dump representation of this instance.
    var snapshotDescription: String { get }
}

extension AnySnapshotStringConvertible {
    public static var renderChildren: Bool {
        return false
    }
}

extension Character: AnySnapshotStringConvertible {
    public var snapshotDescription: String {
        return self.debugDescription
    }
}

extension Data: AnySnapshotStringConvertible {
    public var snapshotDescription: String {
        return self.debugDescription
    }
}

extension Date: AnySnapshotStringConvertible {
    public var snapshotDescription: String {
        return snapshotDateFormatter.string(from: self)
    }
}

extension NSObject: AnySnapshotStringConvertible {
    #if canImport(ObjectiveC)
    @objc open var snapshotDescription: String {
        return purgePointers(self.debugDescription)
    }
    #else
    open var snapshotDescription: String {
        return purgePointers(self.debugDescription)
    }
    #endif
}

extension String: AnySnapshotStringConvertible {
    public var snapshotDescription: String {
        return self.debugDescription
    }
}

extension Substring: AnySnapshotStringConvertible {
    public var snapshotDescription: String {
        return self.debugDescription
    }
}

extension URL: AnySnapshotStringConvertible {
    public var snapshotDescription: String {
        return self.debugDescription
    }
}

private let snapshotDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    return formatter
}()

func purgePointers(_ string: String) -> String {
    return string.replacingOccurrences(of: ":?\\s*0x[\\da-f]+(\\s*)", with: "$1", options: .regularExpression)
}
