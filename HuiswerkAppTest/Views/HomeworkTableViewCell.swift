//
//  HomeworkTableViewCell.swift
//  HuiswerkAppTest
//
//  Created by Jule Dekyvere on 13/08/2021.
//

import UIKit

class HomeworkTableViewCell: UITableViewCell{
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateDueLabel: UILabel!
    
    var homework: Homework! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI(){
        titleLabel.text = homework.Title
        //format the Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        let date = dateFormatter.string(from:homework.DateDue)
        
        dateDueLabel.text = date
    }
}
