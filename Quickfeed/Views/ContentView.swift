//
//  ContentView.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 25/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigatorView(viewModel: UserViewModel(provider: ServerProvider()), selectedCourse: 4)

    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
