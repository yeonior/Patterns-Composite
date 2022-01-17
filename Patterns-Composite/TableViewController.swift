//
//  TableViewController.swift
//  Patterns-Composite
//
//  Created by Ruslan on 17.01.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var currentFolder: Composite = Folder(name: "Main")
    private var tableVC: TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController
        return vc!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func randomNumber() -> Int {
        return Int.random(in: 1...1000)
    }
    
    @IBAction func folderBarButtonAction(_ sender: Any) {
        let folder = Folder(name: "Folder #\(randomNumber())")
        currentFolder.addComponent(folder)
        tableView.reloadData()
    }
    
    @IBAction func fileBarButtonAction(_ sender: Any) {
        let file = File(name: "File #\(randomNumber())")
        currentFolder.addComponent(file)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentFolder.countContent()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        guard let contentArray = currentFolder.showContent() as? [Composite] else { fatalError("Cannot find content!")}
        
        let item = contentArray[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item is Folder ? "Folder" : "File"
        cell.imageView?.image = item is Folder ? UIImage(systemName: "folder") : UIImage(systemName: "doc")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contentArray = currentFolder.showContent() as? [Composite] else { fatalError("Cannot find content!")}
        
        let item = contentArray[indexPath.row]
        
        tableVC.currentFolder = item
        
        item is Folder ? navigationController?.pushViewController(tableVC, animated: true) : print(item.name)
    }
}
