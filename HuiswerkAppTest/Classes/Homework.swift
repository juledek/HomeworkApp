//
//  Homework.swift
//  HuiswerkAppTest
//
//  Created by Jule Dekyvere on 07/08/2021.
//

import Foundation

class Homework{
    let Title: String;
    let Description: String;
    let HomeworkOrTest: Bool; //Homework = true, Test = False
    let DateDue: Date; // When is it due?
    let Course: String; // For what class is the assignment or test?
    
    init(title: String, description: String, homeworkOrTest: Bool, dateDue: Date, course: String) {
        Title = title;
        Description = description;
        HomeworkOrTest = homeworkOrTest;
        DateDue = dateDue;
        Course = course;
    }
}
