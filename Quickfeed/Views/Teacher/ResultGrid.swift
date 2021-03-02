//
//  ResultGrid.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 23/02/2021.
//

import SwiftUI

struct ResultGrid: View {
    @ObservedObject var viewModel: TeacherViewModel
    @Binding var displayingSubmission: Bool
    @State var searchQuery: String = ""
    
    var body: some View {
        VStack{
            Text("Results for \(viewModel.currentCourse.name)")
            Button("test"){self.displayingSubmission = true}
            SearchFieldRepresentable(query: $searchQuery)
                .padding(.horizontal)
                .frame(height: 20)
            
            HStack{
                Text("Name:")
                    .frame(width: 180, alignment: .leading)
                ForEach(self.viewModel.assignments, id: \.self) {assignment in
                    Text(assignment.name)
                    Spacer()
                }
            }
            .padding(2)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 3)
                            .foregroundColor(Color(.unemphasizedSelectedTextBackgroundColor))
            )
            .padding(.horizontal)
            List{
                ForEach(self.filteredLinks().indices, id: \.self){ i in
                    ResultListItem(user: self.filteredLinks()[i].enrollment.user, submissionLinks: self.filteredLinks()[i].submissions)
                        .frame(maxWidth: .infinity)
                        .listRowBackground(RoundedRectangle(cornerRadius: 3)
                                            .foregroundColor(Color(.unemphasizedSelectedTextBackgroundColor))
                                            .opacity(i % 2 == 0 ? 0 : 100)
                        )
                }
            }
            .padding(.top, 0)
        }
        .onAppear(perform: {
        })
    }
    
    func filteredLinks() -> [EnrollmentLink] {
        return viewModel.enrollmentLinks.filter({ matchesQuery(user: $0.enrollment.user) })
    }
    
    func matchesQuery(user: User) -> Bool{
        if searchQuery == ""{
            return true
        }
        
        if  user.name.lowercased().contains(self.searchQuery.lowercased()){
            return true
        }
        
        if  user.email.lowercased().contains(self.searchQuery.lowercased()){
            return true
        }
        
        if user.studentID.lowercased().contains(self.searchQuery.lowercased()){
            return true
        }
        
        if user.login.lowercased().contains(self.searchQuery.lowercased()){
            return true
        }
        
        
        return false
    }
}

struct ResultGrid_Previews: PreviewProvider {
    static var previews: some View {
        ResultGrid(viewModel: TeacherViewModel(provider: FakeProvider(), course: Course()), displayingSubmission: .constant(false))
    }
}
