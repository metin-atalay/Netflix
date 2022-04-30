//
//  SmallVerticalButton.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    var text: String
    var isOnImage:String
    var isOffImage:String
    
    var color: Color = Color.white
    
    var isOn:Bool
    
    var imageName:String {
        return isOn ? isOnImage : isOffImage
    }
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(color)
                
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 14))
                    .bold()
            }
        }
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                print("Tapped")
            }
        }
    }
}
