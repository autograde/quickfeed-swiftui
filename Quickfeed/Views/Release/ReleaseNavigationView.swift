//
//  ReleaseNavigationView.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 05/03/2021.
//

import SwiftUI

struct ReleaseNavigationView: View {
    @ObservedObject var viewModel: TeacherViewModel
    @State private var searchQuery: String = ""
    @Binding var selectedLab: UInt64
    @State private var showCompleted: Bool = true
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Release Submissions")
                    .font(.title)
                LabPicker(labs: viewModel.manuallyGradedAssignments, selectedLab: $selectedLab)
                SearchFieldRepresentable(query: $searchQuery)
                    .frame(height: 25)
                Spacer()
            }
            .padding()
        }
    }
}

struct ReleaseNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseNavigationView(viewModel: TeacherViewModel(provider: FakeProvider(), course: Course()), selectedLab: .constant(1))
    }
}
