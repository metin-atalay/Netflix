//
//  NotificationBar.swift
//  Netflix
//
//  Created by Metin Atalay on 28.04.2022.
//

import SwiftUI

struct NotificationBar: View {
    
    // MARK: - PROPERTY
    
    @Binding var showNotificationList: Bool
    
    // MARK: - BODY
    var body: some View {
        
        Button {
            
        } label: {
            HStack {
                Image(systemName: "bell")
                Text("Notifications")
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold, design: .rounded))
        }
        .foregroundColor(.white)
        .padding()
    }
    
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            NotificationBar(showNotificationList: .constant(false))
                .previewLayout(.fixed(width: 100, height: 50))
        }
    }
}
