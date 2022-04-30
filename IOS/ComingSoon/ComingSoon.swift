//
//  ComingSoon.swift
//  Netflix
//
//  Created by Metin Atalay on 28.04.2022.
//

import SwiftUI

struct ComingSoon: View {
    // MARK: - PROPERTIES
    
    @State private var showNotificationList: Bool = false
    @State private var movieDetailToShow: Movie?
    @State private var navBarHidden = true
    
    @State var scrollOffset: CGFloat = 0.0
    @State var activeIndex = 0
    
    @ObservedObject var vm = ComingSoonVM()
    
    
    // MARK: - FUNC
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let remove105 = scroll - 105
            
            let active = Int(remove105 / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        let movies = vm.movies.enumerated().map({$0})
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        
      //  NavigationView {
           return Group {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(Array(movies), id:\.offset) { index, movie in
                                ComingSoonRow(movie: movie , movieDetailToShow: $movieDetailToShow)
                                    .frame(height: 400)
                                    .overlay(
                                        Group {
                                            index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                        }
                                            .animation(.easeInOut)
                                    )
                                   
                            }
                        }
                    }
                    .foregroundColor(.white)
                    
                    NavigationLink(destination: Text("Notifications List"), isActive: $showNotificationList) {
                       // EmptyView()
                    }
                    .navigationTitle("")
                    .navigationBarHidden(navBarHidden)
                    
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                        self.navBarHidden = true
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                        self.navBarHidden = false
                    }
                }
                
                
            }
            
       // }
    }
    
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
