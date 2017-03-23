//
//  CalendarAddEventVC.swift
//  Calendar
//
//  Created by Erik Myhrberg on 2017-03-23.
//  Copyright © 2017 Erik. All rights reserved.
//

import UIKit

class CalendarAddEventVC: UIViewController, UITextFieldDelegate {

    let formatter = DateFormatter()
    
    var selectedDay: String!
    
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet weak var changeDateConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Format for dateTextField. formatter is a constant declared at the top
        formatter.dateFormat = "MMMM d, yyyy"
        
        // UITextFieldDelegate is useful for keyboard removal and efficiency
        descriptionTextField.delegate = self
        dateTextField.delegate = self
        
        // datePicker Settings
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        // Set date and datepicker to correct value depending on what date user did select
        let datePickerDate = formatter.date(from: selectedDay)
        
        datePicker.date = datePickerDate!
        dateTextField.text = selectedDay
        
        // Hide changeDate
        changeDateConstraint.constant = -244
    }

    // User did press return. Removes the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descriptionTextField.resignFirstResponder()
        return true
    }
    
    // User did press outside keyboard. Removes the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func dateTextFieldPressed(_ sender: UIButton) {
        self.view.endEditing(true)
        
        changeDateConstraint.constant = 0 //Show
    }
    
    @IBAction func donePressed(_ sender: Any) {

        //Assign dateTextField to datePicker's date
        let datePickerDate = formatter.string(from: datePicker.date)
        dateTextField.text = datePickerDate
        print(datePickerDate)
        
        changeDateConstraint.constant = -244 //Hide
    }
    
    @IBAction func dismissPressed(_ sender: Any) {
        //Go back to calendar. Don't save anything and remove event circle
        dismiss(animated: true, completion: nil)
    }
 
    @IBAction func savePressed(_ sender: Any) {
        //Go back to calendar. Save descriptionTextField with NSUserDefauls.
        dismiss(animated: true, completion: nil) //Change nil to stuff later
    }
    
    
}
