//
//  SwiftUIVideoView.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {
    
    // MARK: - PROPERTIES
    
    var url :URL
    
    // MARK: - FUNC
    
    private var player : AVPlayer {
        AVPlayer(url: url)
    }
    
    // MARK: - BODY
    var body: some View {
         VideoPlayer(player: player)
    }
}

struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoView(url: exampleVideoURL)
    }
}
