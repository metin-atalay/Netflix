//
//  MoviePreviewCell.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {
    
    // MARK: - PROPERTIES
    
    var movie: Movie
    
    let colors: [Color] = [.yellow, .gray, .pink, .red, .blue, .green, .orange]
    
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(lineWidth: 3.0)
                            .foregroundColor(colors.randomElement()))
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y : -20)
                .frame(height: 65)
            
        }
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            MoviePreviewCell(movie: exampleMovie1)
                .frame(width: 165, height: 50)
        }
    }
}
