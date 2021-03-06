//
//  ChatVC.swift
//  ShareSpace
//
//  Created by Eric Davenport on 6/15/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class ChatVC: UIViewController {
  
  private let chatView = ChatTableView()
  
  private var keyboardIsVisible = false
  
  private var originalYConstraint: NSLayoutConstraint!
  private var messageViewConstraint: NSLayoutConstraint!
  
  private var listener: ListenerRegistration?
  private var statusListener: ListenerRegistration?


  var chat: Chat?
  var user2ID = String() {
    didSet {
      print("user 2: \(user2ID)")
    }
  }

  private var thread = [Message]() {
    didSet {
      chatView.tableView.reloadData()
//      chatView.tableView.
        if thread.isEmpty {
            chatView.tableView.backgroundView = EmptyView(title: "No message found", messege: "")
        } else {
            chatView.tableView.backgroundView = nil
        }
    }
  }
  
  override func loadView() {
    view = chatView
    view.backgroundColor = .systemGroupedBackground

  }

    override func viewDidLoad() {
        super.viewDidLoad()
//      chatView.userProfileImageView.layer.cornerRadius = chatView.userProfileImageView.frame.width / 2
      
        tableViewSetup()
//      messageStachConstraint = chatView.messageStack.constraintsAffectingLayout(for: .horizontal)
      chatView.chatId = chat?.id
      chatView.reservationId = chat?.reservationId
      chatView.controller = self
      chatView.hostId = user2ID
        chatView.chat = chat
      chatView.updateUI()
//      updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        listenerSetup()
        statusListenerSetup()

    }
  
  override func viewDidDisappear(_ animated: Bool) {
     super.viewDidDisappear(true)
     listener?.remove()
     statusListener?.remove()
   }
  
  private func tableViewSetup() {
    chatView.tableView.dataSource = self
    chatView.tableView.register(ChatCell.self, forCellReuseIdentifier: "chatCell")
    chatView.messageInput.delegate = self
    chatView.messageField.delegate = self
  }
  // TODO: Keyboard handling to be completed
  private func registerForKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  private func unregisterForKeyboardNotifications() {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

  }

  @objc private func keyboardWillShow(_ notification: NSNotification) {

    // UIKeyboardFrameBeginUserInfoKey
    // retrieving keyboard height
    guard let keyboardFrame = notification.userInfo?["UIKeyboardFrameBeginUserInfoKey"] as? CGRect else {
      return
    }


    movedKeyboardUp(keyboardFrame.size.height)
  }

  @objc private func keyboardWillHide(_ notification: NSNotification) {
    resetUI()
  }
/*
   @objc func keyboardWillShow(notification: NSNotification) {
       if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
           if self.view.frame.origin.y == 0 {
               self.view.frame.origin.y -= keyboardSize.height
           }
       }
   }

   @objc func keyboardWillHide(notification: NSNotification) {
       if self.view.frame.origin.y != 0 {
           self.view.frame.origin.y = 0
       }
   }
   */
  private func movedKeyboardUp(_ height: CGFloat) {
    if keyboardIsVisible { return }  // prevents it from moving constraints multiple times
    originalYConstraint = NSLayoutConstraint(item: chatView.messageStack, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 0, constant: 0) // save original value

    print("Original Y = \(originalYConstraint.constant)")
    originalYConstraint.constant -= (height * 0.80)

    UIView.animateKeyframes(withDuration: 1, delay: 0.0, options: [], animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)

    UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options:[] , animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)

    keyboardIsVisible = true
  }

  private func resetUI() {
    keyboardIsVisible = false
    print("Original Y = \(originalYConstraint.constant)")

    messageViewConstraint.constant -= originalYConstraint.constant

    UIView.animate(withDuration: 1.0) {
      self.view.layoutIfNeeded()
    }
  }
  
  private func statusListenerSetup() {
  guard let reservationId = chat?.reservationId else {
    return
  }
    statusListener = DatabaseService.shared.db.collection(DatabaseService.reservationCollection).document(reservationId).addSnapshotListener(includeMetadataChanges: true, listener: { (snapshot, error) in
    if let error = error {
      print("unable to update: \(error)")
    } else if let snapshot = snapshot {
      let reservation = Reservation(dict: snapshot.data()!)
      if reservation.status == 2 {
        self.chatView.statusLabel.text = "PENDING"
        self.chatView.statusLabel.textColor = .systemRed
        self.chatView.statusLabel.backgroundColor = .clear
        self.chatView.rightStatusView.backgroundColor = .clear
        self.chatView.leftStatusView.backgroundColor = .clear
        
      } else if reservation.status == 1  {
        self.chatView.statusLabel.text = "DECLINED"
        self.chatView.statusLabel.textColor = .black
        self.chatView.statusLabel.backgroundColor = .systemRed
        self.chatView.rightStatusView.backgroundColor = .systemRed
        self.chatView.leftStatusView.backgroundColor = .systemRed
        
      } else if reservation.status == 0 {
        self.chatView.statusLabel.text = "ACCEPTED"
        self.chatView.statusLabel.textColor = .black
        self.chatView.statusLabel.backgroundColor = .systemGreen
        self.chatView.rightStatusView.backgroundColor = .systemGreen
        self.chatView.leftStatusView.backgroundColor = .systemGreen
        
      }
      
    }
  })
    }
    
  private func listenerSetup() {
    guard let chatId = chat?.id, let selfId = AuthenticationSession.shared.auth.currentUser?.uid else {
        return
    }
    
    listener = DatabaseService.shared.db.collection(DatabaseService.chatsCollection).document(chatId).collection(DatabaseService.threadCollection).order(by: "created", descending: false).addSnapshotListener(includeMetadataChanges: true) {[weak self] (snapshot, error) in
       if let error = error {
         print("error loading messages: \(error)")
       } else if let snapshot = snapshot {
        let msgs = snapshot.documents.map{Message($0.data())}
        self?.chatView.tableView.scrollToNearestSelectedRow(at: .bottom, animated: true)
        DatabaseService.shared.loadUser(userId: selfId) {[weak self] (result) in
        switch result {
        case .failure(let error):
            self?.showAlert(title: error.localizedDescription, message: nil)
        case .success(let user):
            guard let blockedUsers = user.blockedUsers else {
                return
            }
            let msgsWOBlockedUser = msgs.filter{!blockedUsers.contains($0.senderID)}
            self?.thread = msgsWOBlockedUser
            }
        }
        
        
         //self.thread.removeAll()
//         for message in snapshot.documents {
//           let msg = Message(message.data())
//           self.thread.append(msg)
//          self.chatView.tableView.scrollToNearestSelectedRow(at: .bottom, animated: true)
////           print("Message data: \(msg)")
//         }
       }
     }
   }
  


}


extension ChatVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return thread.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as? ChatCell,
    let user = Auth.auth().currentUser else {
      fatalError("unable to downcast cell")
    }
    let message = thread[indexPath.row]
    cell.message = message
    cell.messageLabel.text = message.content
    cell.layoutIfNeeded()
    if message.senderID == user.uid {
      cell.isIncoming = false
    } else {
      cell.isIncoming = true
      cell.trailingConstraint.isActive = false
      cell.leadingConstraint.isActive = true
      
      cell.incomeDateConstraints.isActive = false
      cell.outgoingDateConstraint.isActive = true
    }

    return cell
    
  }
  
  //TODO: seperate messages by date using header
//  func numberOfSections(in tableView: UITableView) -> Int {
//
//  }
//
//  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//  }
  
  

}


extension ChatVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.placeholder = ""
  }
  

  
  
  
}

extension ChatVC: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    clearPlaceHolder(textfield: self.chatView.messageField)
  }
  
  private func clearPlaceHolder(textfield: UITextField) {
    textfield.placeholder = ""
  }
  
  private func setPlaceHolder(textfield: UITextField) {
    textfield.placeholder = "enter message"
  }
  
}
