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
        
        let Storyboard = UIStoryboard(name: "Content", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
        
        DvC.getName0 = cl.firstName
        DvC.getName = cl.lastName
        DvC.getPhoneNum = cl.mobileNo
        
        self.navigationController?.pushViewController(DvC, animated: true)
            
            
    }
    

    
    

    
    
   
        
}


