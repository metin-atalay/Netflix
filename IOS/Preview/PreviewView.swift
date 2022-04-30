//
//  PreviewView.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import SwiftUI

struct PreviewView: View {
    
    // MARK: - PROPS
    
    @ObservedObject var vm: PreviewVM
    @Environment(\.presentationMode) var presentationMode
    
    var playVideo: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(videoURL: vm.movie.trailers.first?.videoURL, playVideo: .constant(playVideo))
            
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0 ) {
                        Text(vm.movie.name)
                            .foregroundColor(vm.movie.accentColor)
                            .bold()
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(systemName: "chevron.down.circle")
                            .resizable()
                            .frame(width: 42, height: 42, alignment: .center)
                            .imageScale(.large)
                            .font(Font.title.weight(.ultraLight))
                            .foregroundColor(vm.movie.accentColor)
                        
                    }.padding(.trailing, 15)

                    
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                
                Spacer()
                
                
                HStack {
                    ForEach(0..<vm.movie.categories.count) { catIndex in
                        
                        let category = vm.movie.categories[catIndex]
                        
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if  catIndex != vm.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(
                        text: "My List",
                        isOnImage: "checkmark",
                        isOffImage: "plus",
                        color: vm.movie.accentColor,
                        isOn: true) {
                            //
                        }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(vm.movie.accentColor, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticalButton(
                        text: "Info",
                        isOnImage: "info.circle",
                        isOffImage: "info.circle",
                        color: vm.movie.accentColor,
                        isOn: true) {
                            //
                        }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
                
                
            }
            .padding(.bottom, 48)
            .foregroundColor(vm.movie.accentColor)
            
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1), playVideo: true)
    }
}
