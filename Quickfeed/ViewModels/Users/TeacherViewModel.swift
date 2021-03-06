//
//  TeacherViewModel.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 03/02/2021.
//

import Foundation
import Combine

class TeacherViewModel: UserViewModelProtocol{
    var provider: ProviderProtocol
    @Published var user: User
    @Published var currentCourse: Course
    @Published var enrollments: [Enrollment] = []
    @Published var users: [User] = []
    @Published var courses: [Course] = []
    @Published var assignments: [Assignment] = []
    @Published var manuallyGradedAssignments: [Assignment] = []
    @Published var enrollmentLinks: [EnrollmentLink] = []
    @Published var gradingBenchmarkForAssignment = [UInt64 : [GradingBenchmark]]()
    @Published var assignmentMap = [UInt64 : Assignment]()
    
    
    init(provider: ProviderProtocol, course: Course) {
        self.provider = provider
        self.user = provider.getUser() ?? User()
        self.currentCourse = course
        self.loadAssignments()
        self.loadUsers()
    }
    
    
    func getCourse(courseId: UInt64) -> Course{
        for course in self.courses{
            if course.id == courseId{
                return course
            }
        }
        return Course()
    }
    
    func loadUsers(){
        self.users = self.getStudentsForCourse(courseId: self.currentCourse.id)
    }
    
    
    func loadCourses() {
        self.courses = self.provider.getCourses()
    }
    
    func loadEnrollmentLinks(){
        let courseSubmissions = self.provider.getSubmissionsByCourse(courseId: self.currentCourse.id, type: SubmissionsForCourseRequest.TypeEnum.all)
        self.enrollmentLinks = courseSubmissions.links
    }
    
    func loadEnrollments(){
        self.enrollments = self.provider.getEnrollmentsByCourse(courseId: self.currentCourse.id)
    }
    
    func loadAssignments(){
        self.assignments =  self.provider.getAssignments(courseID: self.currentCourse.id)
        print(self.assignments.count)
        self.loadManuallyGradedAssignments(courseId: self.currentCourse.id)
        for assignment in assignments{
            self.assignmentMap[assignment.id] = assignment
        }
        
    }
    
    func loadManuallyGradedAssignments(courseId: UInt64){
        self.manuallyGradedAssignments =  self.assignments.filter{ assignment in
            assignment.skipTests // skipTests -> assignments is manually graded
        }
    }
    
    func getSubmissionsByUser(courseId: UInt64, userId: UInt64) -> [Submission]{
        return self.provider.getSubmissionsByUser(courseId: courseId, userId: userId)
    }
    
    func loadBenchmarks(){
        for assignment in manuallyGradedAssignments {
            self.gradingBenchmarkForAssignment[assignment.id] = self.provider.loadCriteria(courseId: assignment.courseID, assignmentId: assignment.id)
        }
    }
    
    
    func getAssignmentById(id: UInt64) -> Assignment{
        for course in self.courses{
            for assignment in course.assignments{
                if assignment.id == id{
                    return assignment
                }
            }
        }
        return Assignment()
    }
    
    func getUserName(userId: UInt64) -> String{
        for user in self.users{
            if user.id == userId{
                return user.name
            }
        }
        return "None"
    }
    
    func getStudentsForCourse(courseId: UInt64) -> [User]{
        let course = provider.getCourse(courseId: courseId)
        let users = provider.getUsersForCourse(course: course ?? Course())
        
        self.users = users
        
        return users
        
    }
    
    // MANUAL GRADING
    func createReview() -> Review?{
        let review = Review()
        
        return self.provider.createReview(courseId: self.currentCourse.id, review: review)
    }
    
    
    func reset() {
        
    }
    
    
}
