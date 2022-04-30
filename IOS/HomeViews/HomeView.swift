//
//  HomeView.swift
//  Netflix
//
//  Created by Metin Atalay on 24.04.2022.
//

import SwiftUI

struct HomeView: View {
    
    var vm: HomeVM = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var  homeGenre : HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
   
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
               
            //: main vstack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                   
                    
                    TopMoviePreview(movie: exampleMovie6)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    MoviePreviewRow(movies: exampleMovies)
                    
                    HomeStack(vm:vm , topRowSelection: topRowSelection, selectedGenre : homeGenre, movieDetailToShow: $movieDetailToShow) //: FOR
                    
                }  //: VSTACK
            } //: ScrollView
            
            
            if(movieDetailToShow != nil) {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack (spacing: 40){
                        
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            Button {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            } label: {
                                
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                } else {
                                    Text("\(topRow.rawValue)")
                                }
                                
                            }

                        } //: FOR
                        
                     Spacer()
                        
                        Button {
                            showTopRowSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 30)

                        
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title3)
            }
            
            
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack (spacing: 40){
                        
                        Spacer()
                        
                        ScrollView {
                            ForEach(vm.allGenre, id: \.self) { topRow in
                                Button {
                                    homeGenre = topRow
                                    showGenreSelection = false
                                } label: {
                                    
                                    if topRow == homeGenre {
                                        Text("\(topRow.rawValue)")
                                            .bold()
                                    } else {
                                        Text("\(topRow.rawValue)")
                                    }
                                    
                                }
                                
                            } //: FOR
                        }
                        
                     Spacer()
                        
                        Button {
                            showGenreSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 30)

                        
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title3)
            }
            
            
            
        } //: ZSTACK
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding  var showGenreSelection : Bool
    @Binding  var showTopRowSelection : Bool
    
    var body: some View {
        
        switch topRowSelection {
        case .home :
            
            HStack {
                
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                }
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button {
                    topRowSelection = .tvShows
                } label: {
                    Text("TV Shows")
                }
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                }
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                }
                .buttonStyle(PlainButtonStyle())
                
            }

            .padding(.leading, 10)
            .padding(.trailing, 30)
        
            
        case .movies, .myList, .tvShows :
            HStack {
                
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                }
                .buttonStyle(PlainButtonStyle())
                
                
               
                
                HStack(spacing:20) {
                    Button {
                        showTopRowSelection = true
                    } label: {
                        Text(topRowSelection.rawValue)
                            .font(.system(size: 18))
                        
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 10))
                            .rotationEffect(.degrees(180), anchor: .center)
                          
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    
                    Button {
                        showTopRowSelection = true
                    } label: {
                        Text(homeGenre.rawValue)
                            .font(.system(size: 12))
                        
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 6))
                            .rotationEffect(.degrees(180), anchor: .center)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    Spacer()
                    
                }
            }

            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
    }
       
}


