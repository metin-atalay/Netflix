//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    // MARK: - PROPERTIES
    
    var movie: Movie
    
    
    // MARK: - FUNC
    
    func isCategoryLast(_ cat: String) -> Bool {
        return cat == movie.categories.last
    }
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
            
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id : \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        print("Tapped")
                    }
                    Spacer()
                    
                    PlayButton(text: "Play", imageName: "play.fill") {
                        
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "plus", isOn: true) {
                        print("Tapped")
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .background( LinearGradient.blackOpacityGradient
                            .padding(.top, 250)
            )
        }
        .foregroundColor(.white)
        
        
        
    }
}

struct TopViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie4)
    }
}
