//
//  Trailer.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
