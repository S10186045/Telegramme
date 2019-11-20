//
//  Message.swift
//  Telegramme
//
//  Created by Victor Jong on 19/11/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

class Message{
    var date: Date
    var isSender : BooleanLiteralType
    var text : String
   
    
    init(dat:Date, issender:BooleanLiteralType, txt:String){
        date = dat
        isSender = issender
        text = txt

    }
    


    
}
