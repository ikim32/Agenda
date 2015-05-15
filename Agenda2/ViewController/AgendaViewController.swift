//
//  AgendaViewController.swift
//  Agenda2
//
//  Created by MIguel Saravia on 5/11/15.
//  Copyright (c) 2015 MIguel Saravia. All rights reserved.
//

import UIKit
import Parse
import TSMessages

class AgendaViewController: UIViewController {

    var ObjectAgenda : PFObject! = PFObject(className: "AgendaPersons")
    @IBOutlet weak var NameTxt: UITextField!
    @IBOutlet weak var LastNameTxt: UITextField!
    @IBOutlet weak var PhoneTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var NotesField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotesField.layer.borderColor = UIColor.blackColor().CGColor
        NotesField.layer.borderWidth = 0.5
        NotesField.layer.cornerRadius = 5
        NotesField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DoneBtn(sender: UIBarButtonItem) {
        
        self.ObjectAgenda["name"] = self.NameTxt.text as String
        self.ObjectAgenda["lastname"] = self.LastNameTxt.text as String
        self.ObjectAgenda["phone"] = self.PhoneTxt.text as String
        self.ObjectAgenda["email"] = self.EmailTxt.text as String
        self.ObjectAgenda["content"] = self.NotesField.text as String
        TSMessage.showNotificationWithTitle("Success", subtitle: "save data", type: TSMessageNotificationType.Success)
        ObjectAgenda.saveInBackground()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
