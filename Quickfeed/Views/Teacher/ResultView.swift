//
//  ResultView.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 23/02/2021.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: TeacherViewModel
    @State var searchQuery: String = ""
    @State private var displayingSubmission = false
    
    var body: some View {
        VStack{
            if !displayingSubmission {
                ResultGrid(viewModel: viewModel, displayingSubmission: $displayingSubmission)
            }
            if displayingSubmission {
                // SubmissionResults(show: $show)
                SubmissionResult(displayingSubmission: $displayingSubmission)
                
            }
        }
        .onAppear(perform: {
            
        })
    }
}

struct ResultGridView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: TeacherViewModel(provider: FakeProvider(), course: Course()))
            
    }
}
