//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import Foundation
import SwiftUI
import Combine

extension View {
        /// Apply corner radius to specific corners of a view.
        ///
        /// - Parameters:
        ///   - radius: The corner radius to apply.
        ///   - corners: The corners to round.
        ///
        /// - Returns: A modified view with corner radius applied to specified corners.
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }

        /// Apply a linear gradient background to a view.
        ///
        /// - Parameters:
        ///   - colors: An array of `Color` objects representing the gradient colors.
        ///   - startPoint: The starting point of the gradient. Defaults to `.top`.
        ///   - endPoint: The ending point of the gradient. Defaults to `.bottom`.
        ///
        /// - Returns: A modified view with a linear gradient background.
    func commonLinearGradient(colors: [Color], startPoint: UnitPoint = .top, endPoint: UnitPoint = .bottom) -> some View {
        self.background(
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: startPoint,
                endPoint: endPoint
            )
        )
    }
}



struct TextFieldLimitModifier: ViewModifier {
    @Binding var text: String
    let limit: Int

    func body(content: Content) -> some View {
        content
            .onReceive(Just(text)) { newText in
                if newText.count > limit {
                    text = String(newText.prefix(limit))
                }
            }
    }
}

extension View {
    func textFieldLimit(_ limit: Int, text: Binding<String>) -> some View {
        self.modifier(TextFieldLimitModifier(text: text, limit: limit))
    }
}


extension View {
    func makePrimaryLabel() -> some View {
        padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .cornerRadius(10)
    }
}
extension View {
    func makeChangeColorToggle(isOn: Binding<Bool>) -> some View {
        Toggle(isOn: isOn) {
            self
                .foregroundColor(isOn.wrappedValue ? .red : .blue)
        }
        .padding()
    }
}

extension View {
    func makeRedCapsuleBackground() -> some View {
        self
            .padding()
            .background(
                Capsule()
                    .foregroundColor(.red)
            )
    }
}

extension ViewBuilder {
    public static func buildBlock<each C: View>(
_ c: repeat each C
 )  -> TupleView<(repeat each C)> {
        return TupleView((repeat each c))
    }
}


extension ViewBuilder {
        /// `ViewBuilder` extension to build TupleView with 15 child view.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14>
        // Parameters.
    (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14)
        // Return type.
    -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14)>
        // Type constraints.
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View, C10: View, C11: View, C12: View, C13: View, C14: View
        // Function body.
    {
    TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14))
    }
}


extension ViewBuilder {

        /// `ViewBuilder` extension to build TupleView with 15 child view (using `Group` as well).
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14>
        // Parameters.
    (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14)
        // Return type.
    -> TupleView<
        (
            Group<TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>>,
            Group<TupleView<(C10, C11, C12, C13, C14)>>
        )
    >
        // Type constraints.
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View, C10: View, C11: View, C12: View, C13: View, C14: View
        // Function body.
    {
    TupleView(
        (
            Group { TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9)) },
            Group { TupleView((c10, c11, c12, c13, c14)) }
        )
    )
    }
}
  

extension View {

        /// Reads the view frame and bind it to the reader.
        /// - Parameters:
        ///   - coordinateSpace: a coordinate space for the geometry reader.
        ///   - reader: a reader of the view frame.
    func readFrame(in coordinateSpace: CoordinateSpace = .global,
                   for reader: Binding<CGRect>) -> some View {
        readFrame(in: coordinateSpace) { value in
            reader.wrappedValue = value
        }
    }

        /// Reads the view frame and send it to the reader.
        /// - Parameters:
        ///   - coordinateSpace: a coordinate space for the geometry reader.
        ///   - reader: a reader of the view frame.
    func readFrame(in coordinateSpace: CoordinateSpace = .global,
                   for reader: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(
                        key: FramePreferenceKey.self,
                        value: geometryProxy.frame(in: coordinateSpace)
                    )
                    .onPreferenceChange(FramePreferenceKey.self, perform: reader)
            }
        )
    }
}

private struct FramePreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
