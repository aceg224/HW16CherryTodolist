//
//  CherrysTableViewController.swift
//  HW16CherryTodolist
//
//  Created by min-chia on 2019/3/2.
//  Copyright © 2019 min-chia. All rights reserved.
//

import UIKit
import CoreData
var cherrys = [CherryEntity]()
var context : NSManagedObjectContext!
class CherrysTableViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        let request = NSFetchRequest<CherryEntity>(entityName: "CherryEntity")
        do {
            cherrys = try context.fetch(request)
            tableView.reloadData()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cherrys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cherryCell", for: indexPath) as! CherryTableViewCell        
        cell.nameLabel.text = cherrys[indexPath.row].name
        cell.addressLabel.text = cherrys[indexPath.row].address
        if cherrys[indexPath.row].check == 3 {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
                cherrys[indexPath.row].check = Int32(UITableViewCell.AccessoryType.none.rawValue)
            }else{
                cell.accessoryType = .checkmark
                cherrys[indexPath.row].check = Int32(UITableViewCell.AccessoryType.checkmark.rawValue)
            }
            tableView.deselectRow(at: indexPath, animated: true)
            do {
                if context.hasChanges {
                    try context.save()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing {
            sender.title = "Done"
        }else{
            sender.title = "Edit"
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(cherrys[indexPath.row])
            do {
                if context.hasChanges {
                    try context.save()
                    cherrys.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     let movecherry = cherrys[fromIndexPath.row]
     cherrys.remove(at: fromIndexPath.row)
     cherrys.insert(movecherry, at: to.row)
     }
     */
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func unwindToAddCherryTableViewController(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}
