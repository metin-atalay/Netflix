//
//  TrailerList.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI

struct TrailerList: View {
    
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(trailers) { trailer in
                    VStack(alignment: .leading) {
                        VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                            .frame(maxWidth: screen.width)
                        
                            Text(trailer.name)
                            .font(.headline)
                                .multilineTextAlignment(.leading)
                                .shadow(radius: 3)
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                }
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerList(trailers: exampleTrailers)
        }
    }
}
