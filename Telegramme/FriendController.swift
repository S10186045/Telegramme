//
//  FriendController.swift
//  Telegramme
//
//  Created by Victor Jong on 19/11/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class FriendController{
    
    func AddFriend(friend : Friend){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
        let mfriend = NSManagedObject(entity: entity, insertInto: context)
        mfriend.setValue(friend.name, forKeyPath:"nam")
        mfriend.setValue(friend.profileImageName, forKeyPath:"profileimagename")
    
        
        do{
            try context.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func AddMessageToFriend(friend:Friend,message:Message){
        
    }

    //func retrieveMessageByFriend(friend: Friend)->[Message]{
        
    //}
    
}

