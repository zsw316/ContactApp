//
//  ContactDetailViewController.swift
//  ContactListApp
//
//  Created by Ashley Han on 5/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class ContactDetailViewController: BaseViewController {

    var contactEntity: ContactEntity!
    
    var detailView: ContactDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigation()
        intSubview() 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    func initNavigation() {
        self.navigationItem.title = contactEntity.name
        self.view.backgroundColor = UIColor.purple
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
    }
    
    // MARK: - Subviews
    func intSubview() {
        
        detailView = ContactDetailView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        detailView.configureWithContactEntity(entity: contactEntity)
        view.addSubview(detailView)
        
        // Constaints
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[detailView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["detailView": detailView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[detailView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["detailView": detailView]))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
