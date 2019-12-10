//
//  MessageViewController.swift
//  Telegramme
//
//  Created by Victor Jong on 26/11/19.
//  Copyright © 2019 Victor. All rights reserved.
//



import Foundation
import UIKit

class MessageViewController : UIViewController, UITableViewDelegate{
    
    var contactController:ContactController = ContactController()

    
    var contactList:[Contact] = []
    
    var getName0 = String()
    var getName = String()
    var getPhoneNum = String()
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var secondNameTxt: UITextField!
    @IBOutlet weak var phoneNumTxt: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactList = contactController.retrieveAllContact()
        
        nameLabel.text! = getName0 + " " + getName
        phoneNumLabel.text! = getPhoneNum
        
        firstNameTxt.text! = getName0
        secondNameTxt.text! = getName
        phoneNumTxt.text! = getPhoneNum
        
        
        
    }
    
    
    @IBAction func confirmBtn(_ sender: Any) {
        let c = Contact(firstname: firstNameTxt.text!, lastname: secondNameTxt.text!, mobileno: phoneNumTxt.text!)
        contactController.updateContact(mobileno: getPhoneNum, newContact: c)
        
        
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true, completion: nil)
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


