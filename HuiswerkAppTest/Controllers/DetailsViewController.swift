//
//  DetailsViewController.swift
//  HuiswerkAppTest
//
//  Created by Jule Dekyvere on 11/08/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    
    
    
    var homework: Homework = Homework(title: "nul", description: "nul", homeworkOrTest: false, dateDue: Date(), course: "nul")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllLabels()
        // Do any additional setup after loading the view.
    }
    
    
    func setAllLabels(){
        //format the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        let date = dateFormatter.string(from:homework.DateDue)
        
        titleLabel.text = homework.Title
        descriptionLabel.text = homework.Description
        dueDateLabel.text = "Due on " + date
        courseLabel.text = "This " + (homework.HomeworkOrTest ? "homework" : "test") + " is for the course " + homework.Course
        
        print(homework.HomeworkOrTest)
    }
    
    
    @IBAction func deleteWasTapped(_ sender: Any) {
        let homeworkIndex:Int? = Homeworks.homeworks.hws.firstIndex{$0 === homework}
        Homeworks.homeworks.hws.remove(at: homeworkIndex!)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
