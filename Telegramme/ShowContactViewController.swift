//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P01 on 5/11/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

class ShowContactViewController : UITableViewController{
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
    }
    
    override func viewDidAppear(_ animated: Bool){
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = appDelegate.contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            appDelegate.contactList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cl = appDelegate.contactList[(indexPath as NSIndexPath).row]
        let alert = UIAlertController(title: "Edit", message:"Edit \(cl.firstName)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(alert:UIAlertAction!) in print("Cancle")}))
     
        
        alert.addTextField { (textField)  in textField.placeholder = "Enter your first name" }
        
        alert.addTextField { (textField)  in textField.placeholder = "Enter your last name" }
        
        alert.addTextField { (textField)  in textField.placeholder = "Mobile Num" }
        
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
        let textField = alert.textFields![0] as UITextField
        let textField1 = alert.textFields![1] as UITextField
        let textField2 = alert.textFields![2] as UITextField
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let c = Contact(firstname: textField.text!, lastname: textField1.text!, mobileno: textField2.text!)
            appDelegate.contactList.remove(at: indexPath.row)
            appDelegate.contactList.append(c)
            appDelegate.contactList.sort(by: {$0.firstName < $1.firstName})
            if textField.text != ""{
                print(textField.text!)
                
            } else {
                print("TF 1 is Empty...")
            }
            
            if textField1.text != ""{
                print(textField1.text!)
            } else {
                print("TF 1 is Empty...")
            }
            
            if textField2.text != ""{
                print(textField2.text!)
            } else {
                print("TF 3 is Empty...")
            }
            
            self.tableView.reloadData()
            
            
    }
        alert.addAction(save)
        self.present(alert, animated: true, completion: nil)
    
   
        
}

}
