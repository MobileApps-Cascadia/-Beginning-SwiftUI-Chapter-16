//
//  ContentView.swift
//  Chapter14
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TabView {
                NavBasicsView()
                    .tabItem {
                        Image(systemName: "a.circle")
                        Text("Nav View")
                    }
                NavWithButtonsView()
                    .tabItem {
                        Image(systemName: "b.circle")
                        Text("Buttons")
                    }
                NavSepFilesView()
                    .tabItem {
                        Image(systemName: "c.circle")
                        Text("Sep Files")
                    }
            }
            .tabItem {
                Image(systemName: "1.circle")
                Text("Demos")
                
            }
            TabView {
                DataINTOView()
                    .tabItem {
                        Image(systemName: "a.circle")
                        Text("Data INTO View")
                    }
                TwoWayDataView()
                    .tabItem {
                        Image(systemName: "b.circle")
                        Text("Two Way Data")
                    }
                MultiLevelSharingView()
                    .tabItem {
                        Image(systemName: "c.circle")
                        Text("MultiLevel")
                    }
            }
            .tabItem {
                Image(systemName: "2.circle")
                Text("Sharing Data")
                
            }
            TabView {
                ListsInNavViews()
                    .tabItem {
                        Image(systemName: "a.circle")
                        Text("List of NavLinks")
                    }
                NavStackUpdateView()
                    .tabItem {
                        Image(systemName: "b.circle")
                        Text("NavStack")
                    }

            }
            .tabItem {
                Image(systemName: "3.circle")
                Text("Misc")
                
            }
            ExercisesView()
                .tabItem {
                    Image(systemName: "3.square")
                    Text("Exercises")
                }
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
