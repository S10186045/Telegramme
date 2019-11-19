//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P01 on 5/11/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ShowContactViewController : UITableViewController{
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var contactController:ContactController = ContactController()
    var contactList:[Contact] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
    }
    
    override func viewDidAppear(_ animated: Bool){
        contactList = contactController.retrieveAllContact()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return appDelegate.contactList.count
        return contactList.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        //let contact = appDelegate.contactList[indexPath.row]
        let contact = contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let currentContactNum = self.contactList[indexPath.row].mobileNo
        if editingStyle == UITableViewCell.EditingStyle.delete {
            contactList.remove(at: indexPath.row)
            
            contactController.deleteContact(mobileno: currentContactNum)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cl = contactList[(indexPath as NSIndexPath).row]
        let alert = UIAlertController(title: "Edit", message:"Edit \(cl.firstName)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(alert:UIAlertAction!) in print("Cancle")}))
     
        
        alert.addTextField { (textField)  in textField.placeholder = "Enter your first name" }
        
        alert.addTextField { (textField)  in textField.placeholder = "Enter your last name" }
        
        alert.addTextField { (textField)  in textField.placeholder = "Mobile Num" }
        
        
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            
            let textField = alert.textFields![0] as UITextField
            let textField1 = alert.textFields![1] as UITextField
            let textField2 = alert.textFields![2] as UITextField
            let currentContactNum = self.contactList[indexPath.row].mobileNo
            let c = Contact(firstname: textField.text!, lastname: textField1.text!, mobileno: textField2.text!)
        
            self.contactController.updateContact(mobileno: currentContactNum , newContact: c)
                
            self.tableView.reloadData()
            
            
    }
        alert.addAction(save)
        self.present(alert, animated: true, completion: nil)
    
    
   
        
}

}
