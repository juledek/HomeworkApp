//
//  ViewController.swift
//  HuiswerkAppTest
//
//  Created by Jule Dekyvere on 02/08/2021.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet var HomeworkTable: UITableView!
    var clickedHw: Homework = Homework(title: "nul", description: "nul", homeworkOrTest: false, dateDue: Date(), course: "nul")
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HomeworkTable.delegate = self
        HomeworkTable.dataSource = self
        
        //Make sure the refresh works, and reloads the data.
        HomeworkTable.refreshControl = UIRefreshControl()
        HomeworkTable.refreshControl?.addTarget(self, action: #selector(DidPullToRefresh), for: .valueChanged)
        
    }

    @objc func DidPullToRefresh(){
        print("Start refresh")
        fetchData()
        Homeworks.homeworks.hws.sort { $0.DateDue < $1.DateDue }
        DispatchQueue.main.async {
            self.HomeworkTable.refreshControl?.endRefreshing()
        }
    }
    
    func fetchData(){
        HomeworkTable.reloadData()
        Homeworks.homeworks.hws.sort { $0.DateDue < $1.DateDue }
    }
    
    @IBAction func unwindToMainMenu(sender: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? DetailsViewController {
                vc.homework = clickedHw
            }
        }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Homeworks.homeworks.hws.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeworkCell", for: indexPath) as! HomeworkTableViewCell
        
        cell.homework = Homeworks.homeworks.hws[indexPath.row]
        
        if (cell.homework.HomeworkOrTest){
            cell.contentView.backgroundColor = UIColor(red: 0.94, green: 0.97, blue: 0.98, alpha: 1.00)
        } else {
            cell.contentView.backgroundColor = UIColor(red: 1.00, green: 0.79, blue: 0.79, alpha: 1.00)
        }
        
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Homeworks.homeworks.hws.sort { $0.DateDue < $1.DateDue }
        clickedHw =  Homeworks.homeworks.hws[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: nil)
        print(Homeworks.homeworks.hws.count)
        
        
    }
}

