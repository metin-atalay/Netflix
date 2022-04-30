//
//  HomeStack.swift
//  Netflix
//
//  Created by Metin Atalay on 25.04.2022.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    
    var vm: HomeVM = HomeVM()
    
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
  
    
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                    Spacer()
                } //: HSTACK
                .padding(.leading, 6)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.getMovie(forCat: category,andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 135, height: 200)
                                
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                }
                
                
            } //: VSTACK
           
            
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HomeStack(vm:HomeVM() , topRowSelection: .movies, selectedGenre: .AllGenres, movieDetailToShow: .constant(exampleMovie3))
            }
            .foregroundColor(.white)
        }
    }
}
