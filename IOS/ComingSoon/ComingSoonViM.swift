//
//  ComingSoonViM.swift
//  Netflix
//
//  Created by Metin Atalay on 30.04.2022.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies : [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
