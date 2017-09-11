//
//  ContactListViewController.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class ContactListViewController: BaseViewController {

    let identifier: String = "contactListViewCell"
    
    var contactEntities: [ContactEntity] = []
    fileprivate var tableView: UITableView!
    fileprivate var animationView: ContactListLoadingAnimationView!
    fileprivate var contactsLoaded: Bool = false
    
    fileprivate var sorting: Bool = true
    fileprivate var sortType: SortType = SortType.sortAscending
    fileprivate var sortButton: UIButton!
    
    enum SortType: Int {
        case  sortAscending = 0, sortDescending
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        setupNavigation()
        setupSubviews()
        
        if contactsLoaded {
            tableView.isHidden = false;
            animationView.removeFromSuperview()
        } else {
            tableView.isHidden = true
            fetchContacts()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    private func setupNavigation() {
        self.navigationItem.title = "Contacts";
    }
    
    // MARK: - Subviews
    private func setupSubviews() {
        // tableView
        tableView = UITableView(frame: CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height), style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "ContactListViewCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
        tableView.rowHeight = UITableViewAutomaticDimension;
        view.addSubview(tableView)
        
        // animationView
        animationView = ContactListLoadingAnimationView(frame: CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height))
        animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(animationView)
    }
    
    fileprivate func initSortButton() {
        if contactEntities.count > 1 {
            sortButton = UIButton(type: .custom)
            sortButton.setImage(UIImage(named: "sort-ascending"), for: .normal)
            sortButton.setImage(UIImage(named: "sort-descending"), for: .selected)
            sortButton.sizeToFit()
            sortButton.addTarget(self, action: #selector(ContactListViewController.didTapSortButton), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: sortButton)
        }
    }
    
    func didTapSortButton()
    {
        if !sorting {
            sorting = true
            sortType = SortType.sortAscending
        } else {
            sortButton.isSelected = !sortButton.isSelected
        }
        
        if sortButton.isSelected {
            sortType = SortType.sortDescending
            contactEntities = contactEntities.sorted { (entity1: ContactEntity, entity2:ContactEntity) -> Bool in
                return entity1.name < entity2.name
            }
        } else {
            sortType = SortType.sortAscending
            contactEntities = contactEntities.sorted { (entity1: ContactEntity, entity2:ContactEntity) -> Bool in
                return entity1.name > entity2.name
            }
        }
        
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension ContactListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ContactListViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ContactListViewCell
        let entity: ContactEntity = self.contactEntities[(indexPath.row)]
        
        cell.configureWithContactEntity(entity: entity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entity: ContactEntity = self.contactEntities[(indexPath.row)]
        
        let contactDetailViewController: ContactDetailViewController = ContactDetailViewController()
        contactDetailViewController.contactEntity = entity
        self.navigationController?.pushViewController(contactDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Contacts Loading
extension ContactListViewController
{
    fileprivate func fetchContacts() {
        fetchContactsStarted()
        ContactRequestAPI.fetchContacts(finish: fetchContactsFinished(dataArray:error:))
    }
    
    private func fetchContactsStarted()
    {
        // Hide navigation controller
        hidenNavigationController()
        
        // Start animation view
        animationView.configureTitle(title: "Loading Contacts")
        animationView.startAnimation()
    }
    
    private func fetchContactsFinished(dataArray:NSArray?, error: Error?) -> Void
    {
        if error == nil  {
            parseContactData(dataArray: dataArray)
            fetchContactsSucceed()
        } else {
            fetchContactsFailed(error: error!)
        }
    }
    
    private func parseContactData(dataArray:NSArray?)
    {
        let objects: NSArray = dataArray!
        
        objects.enumerateObjects({ (obj: Any, index: Int, stop: UnsafeMutablePointer<ObjCBool>) in
            let entity: ContactEntity = ContactEntity(dict: obj as! Dictionary<String, Any>)
            self.contactEntities.append(entity)
        })
    }
    
    private func fetchContactsSucceed()
    {
        animationView.stopAnimation()
        animationView.removeFromSuperview()
        showNavigationController(title: "Contacts")
        tableView.isHidden = false
        initSortButton()
        tableView.reloadData()
    }
    
    private func fetchContactsFailed(error: Error)
    {
        animationView.stopAnimation()
        
        let alertController: UIAlertController = UIAlertController(title: "error", message: "loading contacts from network failed", preferredStyle: .alert)
        let retryAction: UIAlertAction = UIAlertAction(title: "Retry", style: .default) { (action: UIAlertAction) in
            self.fetchContacts()
        }
        alertController.addAction(retryAction)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) in
            self.fetchContactsSucceed()
        }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
