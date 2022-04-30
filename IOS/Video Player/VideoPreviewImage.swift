//
//  VideoPreviewImage.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    
    var imageURL: URL
    var videoURL: URL
    @State private var showingVidoePlayer: Bool  = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio( contentMode: .fit)
            
            Button {
                
            } label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }
            .sheet(isPresented: $showingVidoePlayer) {
                SwiftUIVideoView(url:videoURL)
            }
            
            
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
