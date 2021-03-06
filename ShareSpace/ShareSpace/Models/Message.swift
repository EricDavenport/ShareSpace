//
//  Message.swift
//  ShareSpace
//
//  Created by Yuliia Engman on 6/1/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit
import MessageKit
import Firebase

struct Message {
  var id : String
  var content : String
  var created : Timestamp
  var senderID: String
  var senderName: String
  var wasRead: Bool
  
  var dictionary: [String: Any]{
    return ["id": id,
            "content": content,
            "created": created,
            "senderID": senderID,
            "senderName": senderName,
            "wasRead": wasRead]
  }
}

extension Message {

  init(_ dictionary: [String: Any]) {
    self.id = dictionary["id"] as? String ?? "no id"
    self.content = dictionary["content"] as? String ?? "no content"
    self.created = dictionary["created"] as? Timestamp ?? Timestamp(date: Date())
    self.senderID = dictionary["senderID"] as? String ?? "no sender id"
    self.senderName = dictionary["senderName"] as? String ?? "no sender name"
    self.wasRead = dictionary["wasRead"] as? Bool ?? false
  }
}

extension Message: MessageType {
  var sender: SenderType {
//    return SenderType
    return Sender(senderId: senderID, displayName: senderName)
  }
  var messageId: String {
    return id
  }
  var sentDate: Date {
    return created.dateValue()
  }
  var kind: MessageKind {
    return .text(content)
  }
}


