//
//  MembersView.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 16/02/2021.
//

import SwiftUI

struct MembersView: View {
    @EnvironmentObject var viewModel: TeacherViewModel
    var course: Course
    @State var searchQuery: String = ""
    @State var users: [User] = []
    
    func filteredUsers() -> [User] {
        return users.filter({ matchesQuery(user: $0) })
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
    
    var body: some View {
        VStack {
            Text("Users enrolled in \(self.course.name)")
            
            SearchFieldRepresentable(query: $searchQuery)
                .padding(.horizontal)
                .frame(height: 20)
            
            List{
                HStack{
                    Text("Name")
                        .padding(.leading, 4)
                        .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
                    Text("Email")
                        .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
                    Text("Student ID")
                        .frame(idealWidth: 50, maxWidth: .infinity, alignment: .leading)
                    Text("Activity")
                        .frame(idealWidth: 50, maxWidth: .infinity, alignment: .leading)
                    Text("Approved")
                        .frame(idealWidth: 50, maxWidth: .infinity, alignment: .leading)
                    Text("Role")
                        .frame(idealWidth: 50, maxWidth: .infinity, alignment: .leading)
                }
                .padding(2)
                .frame(maxWidth: .infinity)
                .listRowBackground(RoundedRectangle(cornerRadius: 4)
                                    .foregroundColor(Color(.unemphasizedSelectedTextBackgroundColor))
                                    )
                
                
                ForEach(self.filteredUsers().indices, id: \.self){ i in
                    
                    MemberListItem(user: self.filteredUsers()[i])

                    .frame(maxWidth: .infinity)
                    .listRowBackground(RoundedRectangle(cornerRadius: 4)
                                        .foregroundColor(Color(.unemphasizedSelectedTextBackgroundColor))
                                        .opacity(i % 2 == 0 ? 0 : 100)
                                        )
                }
            }
        }
        .onAppear(perform: {
            self.users = self.viewModel.getStudentsForCourse(courseId: self.course.id)
        })
        
    }
    
}

struct MembersView_Previews: PreviewProvider {
    static var viewModel = TeacherViewModel(provider: FakeProvider(), course: Course())
    static var previews: some View {
        MembersView(course: viewModel.getCourse(courseId: 111))
    }
}
