//
//  MoviePreviewRow.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import SwiftUI

struct MoviePreviewRow: View {
    // MARK: - PROPERTIES
    
    var movies: [Movie]
    
    //@Binding var showPreviewFullscreen: Bool
  //  @Binding var previewStartingIndex: Int
    @State var showModal: Bool = false
    
   @State var index = 0
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing,14)
                            .padding(.leading,6)
                            .onTapGesture {
                               showModal = true
                                index = movieIndex
                            }
                           
                    }
                }
            }
            
        }
        .frame(height: 185)
        .sheet(isPresented: $showModal) {
            PreviewList(
                  movies: exampleMovies,
                  currentSelection:  $index , isVisible: .constant(true))
        }
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies)
        }
    }
}
