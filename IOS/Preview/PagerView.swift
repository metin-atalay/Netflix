//
//  PagerView.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import SwiftUI
import CoreMedia

struct PagerView<Content: View>: View {
    
    // MARK: - PROPERTIES
    
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        @ViewBuilder content: () -> Content) {
            self.pageCount = pageCount
            self._currentIndex = currentIndex
            self.content = content()
            self._translation = translation
        }
    
    
    // MARK: - BODY
    var body: some View {
        
        GeometryReader { geo in
            HStack(spacing: 0) {
                self.content.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
            .offset(x: self.translation)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        translation = value.translation.width
                    })
                    .onEnded({ value in
                        let offset = value.translation.width / geo.size.width
                        let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                        
                        print(value.translation.width)
                      
                        currentIndex = min(max(Int(newIndex),0), self.pageCount - 1 )
                        translation = 0
                        
                    })
            )
            .animation(.easeInOut)
        }
        
    }
}

struct PagerDummy:View {
    
    @State private var currentIndex: Int = 0
    @State private var translation: CGFloat = .zero
    
    
    var body: some View {
        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation, content: {
            Color.red
            Color.blue
            Color.black
        })
           
    }
    
}


struct PagerView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PagerDummy()
        
    }
}
