//
//  SubmissionInfo.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 03/03/2021.
//

import SwiftUI

struct SubmissionInfo: View {
    @ObservedObject var viewModel: TeacherViewModel
    @Binding var submissionLink: SubmissionLink
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Score:")
                Spacer()
                Text("\(submissionLink.submission.score)%")
            }
            Divider()
            HStack{
                Text("Reviews:")
                Spacer()
                Text("\(submissionLink.submission.reviews.count) / \(submissionLink.assignment.reviewers)")
            }
            Divider()
            HStack {
                Text("Review Status:")
                Spacer()
                Text("\(submissionLink.submission.reviews.last?.ready ?? false ? "Ready" : "In progress")")
            }
            Divider()
            HStack{
                Text("Submission Status:")
                Spacer()
                Text(translateSubmissionStatus(statusCode: submissionLink.submission.status))
            }
            Divider()
            
            
            
        }
    }
}

struct SubmissionInfo_Previews: PreviewProvider {
    static var previews: some View {
        SubmissionInfo(viewModel: TeacherViewModel(provider: FakeProvider(), course: Course()), submissionLink: .constant(SubmissionLink()))
    }
}
