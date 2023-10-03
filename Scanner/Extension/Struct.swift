//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import Foundation
import SwiftUI

struct FSNumberKey: EnvironmentKey {
    static let defaultValue: Int = 5
}

extension EnvironmentValues {
    public var fsNumber: Int {
        get { self[FSNumberKey.self] }
        set { self[FSNumberKey.self] = newValue }
    }
}

struct FSBoolBindingKey: EnvironmentKey {
    static var defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {
    var fsBoolBinding: Binding<Bool> {
        get { self[FSBoolBindingKey.self] }
        set { self[FSBoolBindingKey.self] = newValue }
    }
}

struct ClosureKey: EnvironmentKey {
    static let defaultValue: () -> Void = { }
}

extension EnvironmentValues {
    public var fsAction: () -> Void {
        get { self[ClosureKey.self] }
        set { self[ClosureKey.self] = newValue }
    }
}
public class FSClass {
    var x: Int

    init(x: Int = 5) {
        self.x = x
    }
}

private struct FSClassKey: EnvironmentKey {
    static let defaultValue = FSClass()
}

extension EnvironmentValues {
    public var fsClass: FSClass {
        get { self[FSClassKey.self] }
        set { self[FSClassKey.self] = newValue }
    }
}
extension View {
        // If condition is met, apply modifier, otherwise, leave the view untouched
    public func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
        Group {
            if condition {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }

        // Apply trueModifier if condition is met, or falseModifier if not.
    public func conditionalModifier<M1, M2>(_ condition: Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
        Group {
            if condition {
                self.modifier(trueModifier)
            } else {
                self.modifier(falseModifier)
            }
        }
    }
}
extension Image {
    init(_ name: String, defaultImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(defaultImage)
        }
    }

    init(_ name: String, defaultSystemImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(systemName: defaultSystemImage)
        }
    }
}
extension View {
    public func saveBounds(viewId: Int, coordinateSpace: CoordinateSpace = .global) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(key: SaveBoundsPrefKey.self, value: [SaveBoundsPrefData(viewId: viewId, bounds: proxy.frame(in: coordinateSpace))])
        })
    }

    public func retrieveBounds(viewId: Int, _ rect: Binding<CGRect>) -> some View {
        onPreferenceChange(SaveBoundsPrefKey.self) { preferences in
            DispatchQueue.main.async {
                    // The async is used to prevent a possible blocking loop,
                    // due to the child and the ancestor modifying each other.
                let p = preferences.first(where: { $0.viewId == viewId })
                rect.wrappedValue = p?.bounds ?? .zero
            }
        }
    }
}

struct SaveBoundsPrefData: Equatable {
    let viewId: Int
    let bounds: CGRect
}

struct SaveBoundsPrefKey: PreferenceKey {
    static var defaultValue: [SaveBoundsPrefData] = []

    static func reduce(value: inout [SaveBoundsPrefData], nextValue: () -> [SaveBoundsPrefData]) {
        value.append(contentsOf: nextValue())
    }

    typealias Value = [SaveBoundsPrefData]
}
 
