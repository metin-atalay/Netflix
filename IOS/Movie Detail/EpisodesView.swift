//
//  EpisodesView.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI

struct EpisodesView: View {
    
    var episodes : [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter({ $0.season == season })
    }
    
    var body: some View {
        VStack {
            
            //: Season Picker
            HStack {
                Button {
                    showSeasonPicker = true
                } label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                }
                Spacer()
            }
            
            //: Episodes list
            
            ForEach(getEpisodes(forSeason: selectedSeason)) { episodes in
                VStack (alignment: .leading) {
                    
                    HStack(spacing: 20) {
                        VideoPreviewImage(imageURL: episodes.thumbnailURL, videoURL: episodes.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        
                        VStack(alignment: .leading) {
                            Text("\(episodes.episodeNumber). \(episodes.name) ")
                            Text("\(episodes.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
              
                    
                    Text(episodes.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        
    }
}

struct EpisodesView_Previews: PreviewProvider {
    
    @State static var showSeasonPicker = false
    
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            EpisodesView(episodes: allExampleEpisodes, showSeasonPicker: $showSeasonPicker, selectedSeason: .constant(2))
        }
    }
}
