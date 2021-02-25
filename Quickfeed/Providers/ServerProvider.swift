//
//  ServerProvider.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 25/02/2021.
//

import Foundation

class ServerProvider: ProviderProtocol{
    var currentUser: User
    var grpcManager: GRPCManager = GRPCManager()

    init() {
        self.currentUser = self.grpcManager.getUser(userId: 100) ?? User()
    }
    
    func getUser() -> User? {
        return self.currentUser
    }
    
    func getCoursesForCurrentUser() -> [Course]? {
        fatalError("Not implemented")
    }
    
    func isAuthorizedTeacher() -> Bool {
        fatalError("Not implemented")
    }
    
    func getCourses() -> [Course] {
        fatalError("Not implemented")
    }
    
    func getUsers() -> [User] {
        fatalError("Not implemented")
    }
    
    func getCourse(courseId: UInt64) -> Course? {
        fatalError("Not implemented")
    }
    
    func changeName(newName: String) {
        fatalError("Not implemented")
    }
    
    func getCoursesStudent() -> [Course] {
        fatalError("Not implemented")
    }
    
    func getAssignments(courseID: UInt64) -> [Assignment] {
        fatalError("Not implemented")
    }
    
    func getUsersForCourse(course: Course) -> [User] {
        fatalError("Not implemented")
    }
    
    func addUserToCourse(course: Course, user: User) -> Bool {
        fatalError("Not implemented")
    }
    
    func changeUserStatus(enrollment: Enrollment, status: Enrollment.UserStatus) -> Status {
        fatalError("Not implemented")
    }
    
    func approveAll(courseId: UInt64) -> Bool {
        fatalError("Not implemented")
    }
    
    func createNewCourse(course: Course) -> Course {
        fatalError("Not implemented")
    }
    
    func updateCourse(course: Course) -> Status {
        fatalError("Not implemented")
    }
    
    func updateCourseVisibility(enrollment: Enrollment) -> Bool {
        fatalError("Not implemented")
    }
    
    func getGroupsForCourse(courseId: UInt64) -> [Group] {
        fatalError("Not implemented")
    }
    
    func updateGroupStatus(groupId: UInt64, status: Group.GroupStatus) -> Status {
        fatalError("Not implemented")
    }
    
    func createGroup(groupId: UInt64, name: String, usersIds: [UInt64]) -> Status {
        fatalError("Not implemented")
    }
    
    func getGroup(groupId: UInt64) -> Group? {
        fatalError("Not implemented")
    }
    
    func deleteGroup(courseId: UInt64, groupId: UInt64) -> Status {
        fatalError("Not implemented")
    }
    
    func getGroupByUserAndCourse(courseId: UInt64, userId: UInt64) -> Group? {
        fatalError("Not implemented")
    }
    
    func updateGroup(group: Group) -> Status {
        fatalError("Not implemented")
    }
    
    func getSubmissionsByUser(courseId: UInt64, userId: UInt64) -> [Submission] {
        fatalError("Not implemented")
    }
    
    func getSubmissionsByGroub(courseId: UInt64, groupId: UInt64) -> [Submission] {
        fatalError("Not implemented")
    }
    
    func getSubmissionsByCourse(courseId: UInt64, type: SubmissionsForCourseRequest.Type) -> [AllSubmissionsForEnrollment] {
        fatalError("Not implemented")
    }
    
    func getEnrollmentsForUser(userId: UInt64) -> [Enrollment] {
        fatalError("Not implemented")
    }
    
    func getOrganization(orgName: String) -> Organization {
        fatalError("Not implemented")
    }
    
    func getProviders() -> [String] {
        fatalError("Not implemented")
    }
    
    func updateAssignments(courseId: UInt64) -> Bool {
        fatalError("Not implemented")
    }
    
    func updateSubmission(courseId: UInt64, submisssion: Submission) -> Bool {
        fatalError("Not implemented")
    }
    
    func updateSubmissions(assignmentID: UInt64, courseID: UInt64, score: UInt32, release: Bool, approve: Bool) {
        fatalError("Not implemented")
    }
    
    func rebuildSubmission(assignmentId: UInt64, submissionId: UInt64) -> Submission? {
        fatalError("Not implemented")
    }
    
    func getRepositories(courseId: UInt64, types: [Repository.Type]) {
        fatalError("Not implemented")
    }
    
    
}