//
//  ResultListItem.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 23/02/2021.
//

import SwiftUI

struct ResultListItem: View {
    var user: User
    var submissionLinks: [SubmissionLink]
    var body: some View {
        HStack{
            Text(user.name)
                .frame(width: 180, alignment: .leading)
            
            ForEach(submissionLinks, id: \.assignment.id){ link in
                Text("\(link.submission.score)%")
                    .frame(width: 40)
                Spacer()
            }
        }
        
    }
}

struct ResultListItem_Previews: PreviewProvider {
    static var previews: some View {
        ResultListItem(user: User(name: "Test User", id: 1, studentID: "111111", isAdmin: false, email: "gfkjdsl@dfsa.com", enrollments: [], login: "oskargj"), submissionLinks: [])
    }
}
