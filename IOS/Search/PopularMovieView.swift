//
//  PopularMovieView.swift
//  Netflix
//
//  Created by Metin Atalay on 27.04.2022.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    
    // MARK: - PROPERTIES
    
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 2 )
                    .padding(.leading, 3)
                
                Text(movie.name)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrowtriangle.right.fill")
                }

                
            }
            .foregroundColor(.white)
            .onTapGesture {
                self.movieDetailToShow = movie
            }
        }
       
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height:75)
               
        }
    }
}
