//
//  ComingSoonRow.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import SwiftUI
import Kingfisher
import AVKit

struct ComingSoonRow: View {
    
    // MARK: - PROPERTY
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    var player: AVPlayer {
        AVPlayer(url: URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!)
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            
            VideoPlayer(player: player).frame(height: 200)
            
            //Color.blue
//            VideoPlayer(player: player)
              //  .frame(height: 200)
            
            VStack {
                
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 75)
                        .clipped()
                    
                    Spacer()
                    
                    Button  {
                        //remind me
                    } label: {
                        VStack(spacing:6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind Me")
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    Button  {
                         movieDetailToShow = movieDetailToShow
                    } label: {
                        VStack(spacing:6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    }
                    .padding(.trailing, 24)
                    
                    
                }
            }
            .font(.caption)
            
            VStack(alignment: .leading) {
                Text(movie.name)
                    .font(.title2)
                    .bold()
                
                Text(movie.episodeDescriptionDisplay)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ComingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(exampleMovie1))
        }
    }
}
