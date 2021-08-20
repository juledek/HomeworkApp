//
//  AddHWViewController.swift
//  HuiswerkAppTest
//
//  Created by Jule Dekyvere on 09/08/2021.
//

import UIKit

class AddHWViewController: UIViewController {

    let myCourses = ["Databases", "Programming", "Analyses", "Android Apps", "iOS Apps", "Design Patterns"];
    var localCourse: String = "";
    let alert = UIAlertController(title: "Warning", message: "Not all fields are completed, or they have an invalid entry", preferredStyle: UIAlertController.Style.alert)
    let alertDate = UIAlertController(title: "Warning", message: "The date you set is either in the past, or it is due today. This is not allowed.", preferredStyle: UIAlertController.Style.alert)
    
    
    var pickerView = UIPickerView();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pickerView.delegate = self;
        pickerView.dataSource = self;
        
        TextCourse.inputView = pickerView;
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        alertDate.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil))
        //self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet var DueDate: UIDatePicker!
    @IBOutlet var HWOrTest: UISegmentedControl!
    @IBOutlet var TextCourse: UITextField!
    @IBOutlet var HWTitle: UITextField!
    @IBOutlet var HWDescription: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        //If any of the fields are empty or have an invalid entry, show a warning
        if TextCourse.text!.isEmpty || HWTitle.text!.isEmpty || HWDescription.text!.isEmpty {
            self.present(alert, animated: true, completion: nil)
        }
        else if DueDate.date <= Date() {
            self.present(alertDate, animated:true, completion: nil)
        }
        else{
            let date: Date = DueDate.date;
            let course: String = TextCourse.text!;
            print(HWOrTest.hashValue)
            let hWOrTest: Bool = HWOrTest.selectedSegmentIndex == 1 ? false : true;
            let title: String = HWTitle.text!;
            let description: String = HWDescription.text!;
            
            let hw = Homework(title: title, description: description, homeworkOrTest: hWOrTest, dateDue: date, course: course);
            
            Homeworks.homeworks.hws.append(hw)
            print(Homeworks.homeworks.hws.count)
            
            performSegue(withIdentifier: "unwindToMainMn", sender: nil)
        }
        
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


extension AddHWViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myCourses.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myCourses[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TextCourse.text = myCourses[row]
        TextCourse.resignFirstResponder();
        
    }
}
