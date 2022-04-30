import Foundation
import SwiftUI

/// A trackable and scrollable view. Read [this link](https://medium.com/@maxnatchanon/swiftui-how-to-get-content-offset-from-scrollview-5ce1f84603ec) for more.
///
/// The trackable scroll view displays its content within the trackable scrollable content region.
///
/// # Usage
///
/// ``` swift
/// struct ContentView: View {
///     @State private var scrollViewContentOffset = CGFloat(0) // Content offset available to use
///
///     var body: some View {
///         TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollViewContentOffset) {
///             ...
///         }
///     }
/// }
/// ```

struct TrackableScrollView<Content>: View where Content: View {
    let axes: Axis.Set
    let showIndicators: Bool
    @Binding var contentOffset: CGFloat
    let content: Content
    
    /// Creates a new instance that’s scrollable in the direction of the given axis and can show indicators while scrolling.
    /// - Parameters:
    ///   - axes: The scrollable axes of the scroll view.
    ///   - showIndicators: A value that indicates whether the scroll view displays the scrollable component of the content offset, in a way that’s suitable for the platform.
    ///   - contentOffset: A value that indicates  offset of content.
    ///   - content: The scroll view’s content.
    init(_ axes: Axis.Set = .vertical, showIndicators: Bool = true, contentOffset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self.showIndicators = showIndicators
        _contentOffset = contentOffset
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { outsideProxy in
            ScrollView(self.axes, showsIndicators: self.showIndicators) {
                ZStack(alignment: self.axes == .vertical ? .top : .leading) {
                    GeometryReader { insideProxy in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: [self.calculateContentOffset(fromOutsideProxy: outsideProxy, insideProxy: insideProxy)])
                    }
                    VStack {
                        self.content
                    }
                }
            }
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                self.contentOffset = value[0]
            }
        }
    }
    
    private func calculateContentOffset(fromOutsideProxy outsideProxy: GeometryProxy, insideProxy: GeometryProxy) -> CGFloat {
        if axes == .vertical {
            return outsideProxy.frame(in: .global).minY - insideProxy.frame(in: .global).minY
        } else {
            return outsideProxy.frame(in: .global).minX - insideProxy.frame(in: .global).minX
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}
