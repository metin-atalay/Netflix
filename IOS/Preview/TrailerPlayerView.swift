//
//  TrailerPlayerView.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    var videoURL: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoURL != nil {
            VideoPlayer(url: videoURL!, play: $playVideo)
        } else {
            Text("Could not load video")
        }
        
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: exampleVideoURL, playVideo: .constant(true))
    }
}
