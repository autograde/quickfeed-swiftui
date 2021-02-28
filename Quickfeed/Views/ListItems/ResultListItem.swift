//
//  ResultListItem.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 23/02/2021.
//

import SwiftUI

struct ResultListItem: View {
    var user: User
    var submissions: [Submission]
    var body: some View {
        HStack{
            Text(user.name)
                .frame(width: 180)
            ForEach(submissions, id: \.id){ submission in
                Text(submission.approvedDate)
            }
        }
        
    }
}

struct ResultListItem_Previews: PreviewProvider {
    static var previews: some View {
        ResultListItem(user: User(name: "Test User", id: 1, studentID: "111111", isAdmin: false, email: "gfkjdsl@dfsa.com", enrollments: [], login: "oskargj"), submissions: [])
    }
}
