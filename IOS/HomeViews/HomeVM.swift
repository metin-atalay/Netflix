//
//  HomeVM.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI

class HomeVM: ObservableObject {
    
    //: String == Category
    @Published var movies : [String : [Movie]] = [:]
    
    public var allCategories : [String] {
         movies.keys.map({ String($0) })
    }
    
    init() {
        setupMovies()
    }
   
    public var allGenre: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Horror, .Thriller]
    
    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? []
            // TODO: Setup MyList Properly
        }
    }
    
    func setupMovies() {
        movies ["Trending Now"] =  exampleMovies
        movies ["Stand-up Comedy"] =  exampleMovies.shuffled()
        movies ["Stand-up Comedy"] =  exampleMovies.shuffled()
        movies ["New Releases"] =  exampleMovies.shuffled()
        movies ["Watch It Again"] =  exampleMovies.shuffled()
        movies ["Sci-Fi Movies"] =  exampleMovies.shuffled()
    }
    
}
