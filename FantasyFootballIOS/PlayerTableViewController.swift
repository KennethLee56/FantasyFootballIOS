//
//  PlayerTableViewController.swift
//  FantasyFootballIOS
//
//  Created by Lee, Kenneth Van on 12/10/19.
//  Copyright © 2019 Lee, Kenneth Van. All rights reserved.
//

import UIKit
import CoreData

class PlayerTableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as!
        AppDelegate).persistentContainer.viewContext
    
    var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPlayers()
        
        self.tableView.rowHeight = 84.0
    }
    
    func loadPlayers() {
        
        let request: NSFetchRequest<Player> = Player.fetchRequest()
        
        do {
            players = try context.fetch(request)
        } catch {
            print("Error fetching Students from Core Data!")
        }
        
        tableView.reloadData()
    }
    
    func savePlayers() {
        do {
            try context.save()
        } catch {
            print("Error saving Students to Core Data!")
        }
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
