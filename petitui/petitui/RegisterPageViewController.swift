//
//  RegisterPageViewController.swift
//  petitui
//
//  Created by alumnos on 10/01/2020.
//  Copyright © 2020 Sergio. All rights reserved.
//

import UIKit
import Foundation
import SkyFloatingLabelTextField

class RegisterPageViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTF: SkyFloatingLabelTextField!
    
    @IBOutlet weak var userEmailTF: SkyFloatingLabelTextField!
    
    @IBOutlet weak var userPasswordTF: SkyFloatingLabelTextField!
    
    @IBOutlet weak var userConfirmPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var inputDate: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Código correspondiente al DatePicker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(RegisterPageViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RegisterPageViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        inputDate.inputView = datePicker
        
        // Do any additional setup after loading the view.
    }
    
    // Check when view is tapped and stop editing.
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    // Check when datePicker is changed and format it into string to set UiTextField.text
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        //print(datePicker.date)
        dateFormatter.dateFormat = "yyyy/MM/dd"
        inputDate.text = dateFormatter.string(from: datePicker.date)
        //print(dateFormatter.string(from: datePicker.date))
    }
    
    //Displays an alert with a message depending on the string passed through parameters
    func displayMyAlertMessage(userMessage:String)
    {
        let alertDisapperTimeInSeconds = 2.0
        let alert = UIAlertController(title: nil, message: userMessage, preferredStyle: .actionSheet)
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertDisapperTimeInSeconds) {
            alert.dismiss(animated: true)
        }
        
    }

    @IBAction func signUpButton(_ sender: Any) {
    
        let userEmail = userEmailTF.text
        let userPassword = userPasswordTF.text
        let userName = usernameTF.text
        let repeatedPassword = userConfirmPassword.text
        
        /*let userRepeatPassword = repeatPasswordTextField.text;*/
        
        //Check if passwords match
        func isValidRepeatedPassword(_ repeatedPassword: String) -> Bool {
            var areEqualPasswords : Bool = false
            
            if(userPassword != repeatedPassword)
            {
                displayMyAlertMessage(userMessage: "Guau, las contraseñas no coinciden");
                areEqualPasswords = false
            } else {
                print("Contraseñas iguales")
                areEqualPasswords = true
            }
            
            return areEqualPasswords
        }
        
        // Check for empty fields
        if(userEmail!.isEmpty || userPassword!.isEmpty || userName!.isEmpty || repeatedPassword!.isEmpty )
        {
            // Alert message
            displayMyAlertMessage(userMessage: "All fields are required!");
            return;
            
        } else {
            
            if(Validator.isValidEmail(userEmail!) && Validator.isValidPassword(userPassword!) && isValidRepeatedPassword(repeatedPassword!)){
                print("OLEEE")
            }else{
                displayMyAlertMessage(userMessage: "mimimimimi");
            }
        }
        
        
  
    
    }
    
}
