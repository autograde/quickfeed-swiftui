//
//  ContentView.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 25/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TeacherNavigationView(viewModel: TeacherViewModel(provider: FakeProvider()), selectedCourse: 111)
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
