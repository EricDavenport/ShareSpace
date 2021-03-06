//
//  ProfileView.swift
//  ShareSpace
//
//  Created by Liubov Kaper  on 5/27/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
        public lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.backgroundColor = .white
            scrollView.frame = self.bounds
            scrollView.showsHorizontalScrollIndicator = true
            scrollView.bounces = true
            return scrollView
        }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func layoutSubviews() {
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.borderColor = UIColor.black.cgColor
        //UIButton.layer.cornerRadius = 13
        
    }
    
//    public lazy var userSegmentedControl: UISegmentedControl = {
//        let items = ["User", "Host"]
//        let segmentedControl = UISegmentedControl(items: items)
//        segmentedControl.frame = CGRect(x: 35, y: 200, width: 250, height: 50)
//        segmentedControl.selectedSegmentTintColor = .yummyOrange
//        segmentedControl.backgroundColor = .oceanBlue
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//        segmentedControl.contentHorizontalAlignment = .center
//        return segmentedControl
//    }()
    
    public lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.layoutSubviews()
        imageView.backgroundColor = .yummyOrange
        imageView.tintColor = .sunnyYellow
        imageView.clipsToBounds = true
        //imageView.layer.borderColor = UIColor.black.cgColor
        
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        //imageView.clipsToBounds = true
        
        return imageView
    }()
    
    public lazy var editProfileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera.circle"), for: .normal)
        button.tintColor = .yummyOrange
        button.clipsToBounds = true
//        button.layer.borderColor = UIColor.black.cgColor
//    button.layer.borderWidth = 1
//    button.layer.masksToBounds = false
//    button.layer.borderColor = UIColor.black.cgColor
//        button.layer.cornerRadius = button.frame.height/2
        
        return button
    }()
    
    public lazy var userDisplayNameLabel: UILabel = {
      let label = UILabel()
      label.text = "Enter username:"
      //label.font = .preferredFont(forTextStyle: .headline)
      //label.backgroundColor = .systemGreen
        label.textColor = .systemGray
      return label
    }()
    
    public lazy var userDisplayNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
        
//        textfield.layer.borderWidth = 1
//        textfield.layer.masksToBounds = false
//        textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//        textfield.layer.cornerRadius = 12 //This will change with corners of image and height/2 will make this circle shape
//        textfield.clipsToBounds = true
        
        textfield.textAlignment = .left
        return textfield
    }()
    
    public lazy var userFirstNameLabel: UILabel = {
      let label = UILabel()
      label.text = "Enter your first name"
        label.textColor = .systemGray
      //label.font = .preferredFont(forTextStyle: .headline)
      //label.backgroundColor = .systemGreen
      return label
    }()
    
    public lazy var userFirstNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "First name"
        textfield.textAlignment = .left
        
//        textfield.layer.borderWidth = 1
//        textfield.layer.masksToBounds = false
//        textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//        textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//        textfield.clipsToBounds = true
        
        return textfield
    }()
    
    public lazy var userLastNameLabel: UILabel = {
      let label = UILabel()
      label.text = "Enter your last name:"
      //label.font = .preferredFont(forTextStyle: .headline)
      //label.backgroundColor = .systemGreen
        label.textColor = .systemGray
      return label
    }()
    
    public lazy var userLastNameTextfield: UITextField = {
           let textfield = UITextField()
           textfield.placeholder = "Last name"
           textfield.textAlignment = .left
        
//        textfield.layer.borderWidth = 1
//        textfield.layer.masksToBounds = false
//        textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//        textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//        textfield.clipsToBounds = true
        
           return textfield
       }()
    
    //FIXME: change for segmented control?
//    public lazy var userTypeTextfield: UITextField = {
//        let textfield = UITextField()
//        textfield.placeholder = "Host or Renter"
//        textfield.textAlignment = .left
//        return textfield
//    }()
    
    public lazy var userLocationLabel: UILabel = {
      let label = UILabel()
      label.text = "Enter your location:"
      //label.font = .preferredFont(forTextStyle: .headline)
      //label.backgroundColor = .systemGreen
     label.textColor = .systemGray
      return label
    }()
    
     public lazy var userLocationTextfield: UITextField = {
               let textfield = UITextField()
               textfield.placeholder = "Location"
               textfield.textAlignment = .left
            
    //        textfield.layer.borderWidth = 1
    //        textfield.layer.masksToBounds = false
    //        textfield.layer.borderColor = UIColor.oceanBlue.cgColor
    //        textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
    //        textfield.clipsToBounds = true
            
               return textfield
           }()
    
    public lazy var userPhoneLabel: UILabel = {
         let label = UILabel()
         label.text = "Enter your phone number:"
         //label.font = .preferredFont(forTextStyle: .headline)
         //label.backgroundColor = .systemGreen
        label.textColor = .systemGray
         return label
       }()
    
    public lazy var userPhoneNumberTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Phone number"
        textfield.textAlignment = .left
        
//        textfield.layer.borderWidth = 1
//        textfield.layer.masksToBounds = false
//        textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//        textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//        textfield.clipsToBounds = true
        
        return textfield
    }()
    
    public lazy var emailNameLabel: UILabel = {
           let label = UILabel()
           label.text = "Your email is (not changing):"
           label.numberOfLines = 1
           label.textAlignment = .left
        label.textColor = .systemGray
           return label
       }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        //label.text = "email"
        label.numberOfLines = 1
        label.textAlignment = .left
        
//        label.layer.borderWidth = 1
//        label.layer.masksToBounds = false
//        label.layer.borderColor = UIColor.oceanBlue.cgColor
//        label.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//        label.clipsToBounds = true
        
        return label
    }()
    
    public lazy var userBioLabel: UILabel = {
        let label = UILabel()
        label.text = "Type your bio:"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
    }()
    
    public lazy var userBioTextview: UITextView = {
        let textview = UITextView()
        //textview.placeholder = "Bio"
        textview.textAlignment = .left
        
//        textview.layer.borderWidth = 1
//        textview.layer.masksToBounds = false
//        textview.layer.borderColor = UIColor.oceanBlue.cgColor
//        textview.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//        textview.clipsToBounds = true
        
        //textview.font = UIFont(name: "System", size: 14)
        
        //label.font = .preferredFont(forTextStyle: .headline)
        
        textview.font = .preferredFont(forTextStyle: .body)
        
        textview.isScrollEnabled = true
        
        return textview
    }()
    
    public lazy var userOccupationLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your occupation:"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
    }()
    
    public lazy var userOccupationTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Occupation"
        textfield.textAlignment = .left
        
//        textfield.layer.borderWidth = 1
//        textfield.layer.masksToBounds = false
//        textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//        textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//        textfield.clipsToBounds = true
        
        return textfield
    }()
    
    public lazy var governmentIdLabel: UILabel = {
    let label = UILabel()
    label.text = "Enter government ID name and number:"
    label.numberOfLines = 1
    label.textAlignment = .left
        label.textColor = .systemGray
    return label
        }()
    
    public lazy var governmentIdNameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Government ID name"
        textfield.textAlignment = .left
        return textfield
    }()
        
//        public lazy var governmentIdNumberTextfield: UITextField = {
//            let textfield = UITextField()
//            textfield.placeholder = "Enter government ID number"
//            textfield.textAlignment = .left
//            return textfield
//        }()
    
    //Should be nil if host!
    
    public lazy var usercardLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your credit ot debit card information:"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
    }()
    
    public lazy var userCreditcardTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Card number"
        textfield.textAlignment = .left
        
//        textfield.layer.borderWidth = 1
//               textfield.layer.masksToBounds = false
//               textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//               textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//               textfield.clipsToBounds = true
        
        
      //  textField setKeyboardType:UIKeyboardTypeNumberPad]
        
        textfield.keyboardType = .numbersAndPunctuation
        
        return textfield
    }()
    
     //Should be nil if host!
    public lazy var userCreditcardCVVNumberTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "CVV number"
        textfield.textAlignment = .left
        
//        textfield.layer.borderWidth = 1
//               textfield.layer.masksToBounds = false
//               textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//               textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//               textfield.clipsToBounds = true
        
        textfield.keyboardType = .numbersAndPunctuation
        
        return textfield
    }()
    
     //Should be nil if host!
    public lazy var userExpirationDateTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Card expiration date"
        textfield.textAlignment = .left
        
//        textfield.layer.borderWidth = 1
//               textfield.layer.masksToBounds = false
//               textfield.layer.borderColor = UIColor.oceanBlue.cgColor
//               textfield.layer.cornerRadius = 7 //This will change with corners of image and height/2 will make this circle shape
//               textfield.clipsToBounds = true
        
        textfield.keyboardType = .numbersAndPunctuation
        
        return textfield
    }()
    
        /*
     public lazy var uploadIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload ID", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    
    //Should be nil if host?
    public lazy var idImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray3
        return imageView
    }()
 */
    
    public lazy var saveChangesButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Save  ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .yummyOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.distribution = .fillEqually
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.backgroundColor = .systemYellow
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:UIScreen.main.bounds)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commomInit()
    }
    
    private func commomInit() {
        setUpScrollviewConstraints()
        setUpContainerviewConstraints()
        setUpProfileImageViewConstraints()
        setUpEditProfileImageButtonConstraints()
        setUpStackViewTextFieldConstraints()
        setUpSaveChangesButtonConstraints()
    }
    
        private func setUpScrollviewConstraints() {
            addSubview(scrollView)
            
            scrollView.translatesAutoresizingMaskIntoConstraints =  false
    
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    
    private func setUpContainerviewConstraints() {
        scrollView.addSubview(containerView)

            containerView.translatesAutoresizingMaskIntoConstraints =  false
        
        let heightConstraint = containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)

            NSLayoutConstraint.activate([
                containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                heightConstraint
            ])
        }
    
    private func setUpProfileImageViewConstraints() {
        containerView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
           profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            profileImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.32)
        ])
    }
    
    private func setUpEditProfileImageButtonConstraints() {
        containerView.addSubview(editProfileImageButton)
        editProfileImageButton.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
            editProfileImageButton.topAnchor.constraint(equalTo:  containerView.topAnchor, constant: 130),
            editProfileImageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -157),
        ])
    }
    
    private func setUpStackViewTextFieldConstraints() {
        containerView.addSubview(stackView)
        //stackView.addArrangedSubview(userSegmentedControl)
        stackView.addArrangedSubview(userDisplayNameLabel)
        stackView.addArrangedSubview(userDisplayNameTextfield)
       stackView.addArrangedSubview(userFirstNameLabel)
        stackView.addArrangedSubview(userFirstNameTextfield)
        stackView.addArrangedSubview(userLastNameLabel)
        stackView.addArrangedSubview(userLastNameTextfield)
        stackView.addArrangedSubview(userLocationLabel)
        stackView.addArrangedSubview(userLocationTextfield)
       // stackView.addArrangedSubview(userTypeTextfield)
        stackView.addArrangedSubview(userPhoneLabel)
        stackView.addArrangedSubview(userPhoneNumberTextfield)
        stackView.addArrangedSubview(emailNameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(userBioLabel)
        stackView.addArrangedSubview(userBioTextview)
        stackView.addArrangedSubview(userOccupationLabel)
        stackView.addArrangedSubview(userOccupationTextfield)
        stackView.addArrangedSubview(governmentIdLabel)
        stackView.addArrangedSubview(governmentIdNameTextfield)
        //stackView.addArrangedSubview(governmentIdNumberTextfield)
        //stackView.addArrangedSubview(uploadIdButton)
        //stackView.addArrangedSubview(idImageView)
        stackView.addArrangedSubview(usercardLabel)
        stackView.addArrangedSubview(userCreditcardTextfield)
        stackView.addArrangedSubview(userCreditcardCVVNumberTextfield)
        stackView.addArrangedSubview(userExpirationDateTextfield)
        
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userBioTextview.heightAnchor.constraint(equalToConstant: 100)
        ])
        
//        NSLayoutConstraint.activate([
//            userBioTextview.heightAnchor.constraint(equalToConstant: 100)
//        ])
    }
    
    private func setUpSaveChangesButtonConstraints() {
        containerView.addSubview(saveChangesButton)
        saveChangesButton.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
            saveChangesButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
           saveChangesButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveChangesButton.widthAnchor.constraint(equalToConstant: 370),
            saveChangesButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -275)
        ])
    }
}
