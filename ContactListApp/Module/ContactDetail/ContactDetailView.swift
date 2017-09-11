//
//  ContactDetailView.swift
//  ContactListApp
//
//  Created by Ashley Han on 5/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class ContactDetailView: BaseView {
    
    private var scrollView: UIScrollView!

    fileprivate var nameLabel: UILabel!
    
    fileprivate var nameTitleLabel: UILabel!
    
    fileprivate var emailLabel: UILabel!
    
    fileprivate var emailTitleLabel: UILabel!
    
    fileprivate var usernameLabel: UILabel!
    
    fileprivate var usernameTitleLabel: UILabel!
    
    fileprivate var phoneLabel: UILabel!
    
    fileprivate var phoneTitleLabel: UILabel!
    
    fileprivate var addressLabel: UILabel!
    
    fileprivate var addressTitleLabel: UILabel!
    
    fileprivate var websiteLabel: UILabel!
    
    fileprivate var websiteTitleLabel: UILabel!
    
    fileprivate var companyLabel: UILabel!
    
    fileprivate var companyTitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    func initSubviews()
    {
        var labelArray: Array<UILabel> = Array<UILabel>()
        
        // ScrollView
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        scrollView.alwaysBounceVertical = true
        scrollView.delegate = self;
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(scrollView)

        // Labels
        emailLabel = UILabel.init()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false;
        emailLabel.font = UIFont.systemFont(ofSize: 15)
        emailLabel.textAlignment = .left
        emailLabel.textColor = UIColor.black
        labelArray.append(emailLabel)
        scrollView.addSubview(emailLabel)
        
        emailTitleLabel = UILabel.init()
        emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTitleLabel.font = UIFont.systemFont(ofSize: 15)
        emailTitleLabel.textAlignment = .left
        emailTitleLabel.textColor = UIColor.darkGray
        labelArray.append(emailTitleLabel)
        scrollView.addSubview(emailTitleLabel)

        usernameLabel = UILabel.init()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false;
        usernameLabel.font = UIFont.systemFont(ofSize: 15)
        usernameLabel.textAlignment = .left
        usernameLabel.textColor = UIColor.black
        labelArray.append(usernameLabel)
        scrollView.addSubview(usernameLabel)
        
        usernameTitleLabel = UILabel.init()
        usernameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameTitleLabel.font = UIFont.systemFont(ofSize: 15)
        usernameTitleLabel.textAlignment = .left
        usernameTitleLabel.textColor = UIColor.darkGray
        labelArray.append(usernameTitleLabel)
        scrollView.addSubview(usernameTitleLabel)
        
        phoneLabel = UILabel.init()
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false;
        phoneLabel.font = UIFont.systemFont(ofSize: 15)
        phoneLabel.textAlignment = .left
        phoneLabel.textColor = UIColor.black
        labelArray.append(phoneLabel)
        scrollView.addSubview(phoneLabel)
        
        phoneTitleLabel = UILabel.init()
        phoneTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneTitleLabel.font = UIFont.systemFont(ofSize: 15)
        phoneTitleLabel.textAlignment = .left
        phoneTitleLabel.textColor = UIColor.darkGray
        labelArray.append(phoneTitleLabel)
        scrollView.addSubview(phoneTitleLabel)
        
        addressLabel = UILabel.init()
        addressLabel.translatesAutoresizingMaskIntoConstraints = false;
        addressLabel.font = UIFont.systemFont(ofSize: 15)
        addressLabel.textAlignment = .left
        addressLabel.textColor = UIColor.black
        addressLabel.numberOfLines = 0
        addressLabel.sizeToFit()
        labelArray.append(addressLabel)
        scrollView.addSubview(addressLabel)
        
        addressTitleLabel = UILabel.init()
        addressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTitleLabel.font = UIFont.systemFont(ofSize: 15)
        addressTitleLabel.textAlignment = .left
        addressTitleLabel.textColor = UIColor.darkGray
        labelArray.append(addressTitleLabel)
        scrollView.addSubview(addressTitleLabel)
        
        websiteLabel = UILabel.init()
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false;
        websiteLabel.font = UIFont.systemFont(ofSize: 15)
        websiteLabel.textAlignment = .left
        websiteLabel.textColor = UIColor.black
        labelArray.append(websiteLabel)
        scrollView.addSubview(websiteLabel)
        
        websiteTitleLabel = UILabel.init()
        websiteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteTitleLabel.font = UIFont.systemFont(ofSize: 15)
        websiteTitleLabel.textAlignment = .left
        websiteTitleLabel.textColor = UIColor.darkGray
        labelArray.append(websiteTitleLabel)
        scrollView.addSubview(websiteTitleLabel)
        
        companyLabel = UILabel.init()
        companyLabel.translatesAutoresizingMaskIntoConstraints = false;
        companyLabel.font = UIFont.systemFont(ofSize: 15)
        companyLabel.textAlignment = .left
        companyLabel.textColor = UIColor.black
        companyLabel.numberOfLines = 0
        companyLabel.sizeToFit()
        labelArray.append(companyLabel)
        scrollView.addSubview(companyLabel)
        
        companyTitleLabel = UILabel.init()
        companyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        companyTitleLabel.font = UIFont.systemFont(ofSize: 15)
        companyTitleLabel.textAlignment = .left
        companyTitleLabel.textColor = UIColor.darkGray
        labelArray.append(companyTitleLabel)
        scrollView.addSubview(companyTitleLabel)
        
        // Constraints
        var lastDockView: UILabel? = nil
        
        for label in labelArray {
            if lastDockView == nil {
                scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[label]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["label": label]))
                scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[label]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["label": label]))
            } else {
                scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lastDockView]-8-[label]", options: .alignAllLeft, metrics: nil, views: ["lastDockView": lastDockView!, "label": label]))
            }
            
            lastDockView = label
        }
        
        if lastDockView != nil {
            scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lastDockView]-8-|", options: .alignAllLeft, metrics: nil, views: ["lastDockView": lastDockView!]))
        }
    }
}

// MARK: - configure data
extension ContactDetailView {
    func configureWithContactEntity(entity: ContactEntity) {
        
        self.emailTitleLabel.text = "EMAIL"
        self.emailLabel.text = entity.email
        
        self.usernameTitleLabel.text = "USENAME"
        self.usernameLabel.text = entity.username
        
        self.phoneTitleLabel.text = "PHONE"
        self.phoneLabel.text = entity.phone
        
        self.addressTitleLabel.text = "ADDRESS"
        self.addressLabel.text = entity.address.info
        
        self.websiteTitleLabel.text = "WEBSITE"
        self.websiteLabel.text = entity.website
        
        self.companyTitleLabel.text = "COMPANY"
        self.companyLabel.text = entity.company.info
    }
}

extension ContactDetailView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
