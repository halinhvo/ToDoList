//
//  ToDoStuff.swift
//  ToDoList
//
//  Created by Scholar on 7/25/25.
//

import Foundation
import SwiftData

@Model

class ToDoStuff {
    var task: String

    init(task: String) {
        self.task = task
    }
}

