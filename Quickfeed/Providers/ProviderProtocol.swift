//
//  ProviderProtocol.swift
//  Quickfeed
//
//  Created by Oskar Gjølga on 03/02/2021.
//

import Foundation
import Combine


protocol ProviderProtocol{
    var currentUser: User { get set }
    func getUser() -> User?
    
    func getCourses() -> [Course]
    func changeName(newName: String)

    
}
