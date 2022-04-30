//
//  DownloadsView.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Smart Dowlands")
                    Text("ON").foregroundColor(.blue)
                    
                    Spacer()
                    
                }
                .padding()
                .font(.system(size: 18, weight: .bold))
                
                ZStack {
                    Circle()
                        .foregroundColor(.graySearchBackground)
                        .padding(.horizontal, 100)
                    
                    Image(systemName: "arrow.down.to.line.alt")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width:75)
                        .foregroundColor(.gray)
                }
                .frame(height:275)
                .padding(.top, 75)
                
                VStack(spacing: 20) {
                    Text("Never be without Netflix")
                        .font(.title2)
                        .bold()
                    Text("Download shows and movies so you'll never be without something to watch \n-- even when you're offline")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    
                    Button(action: {
                        // Show shows that can be downloaded
                    }, label: {
                        Text("See What You Can Download")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                    })
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct DowlandsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            DownloadsView()
        }
    }
}
