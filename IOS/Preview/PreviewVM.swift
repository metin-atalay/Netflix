//
//  PreviewVM.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import Foundation

class PreviewVM: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
