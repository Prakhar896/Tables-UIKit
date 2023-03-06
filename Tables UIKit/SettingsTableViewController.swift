//
//  SettingsTableViewController.swift
//  Tables UIKit
//
//  Created by Prakhar Trivedi on 6/3/23.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    

    @IBOutlet weak var tablesOfLabel: UILabel!
    @IBOutlet weak var tablesOfStepper: UIStepper!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var numQuestionsButton: UIButton!
    
    var tablesOf: Int = 2 {
        didSet {
            tablesOfLabel.text = "Tables of \(tablesOf)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablesOfLabel.text = "Tables of \(tablesOf)"
        setupNumQuestionsContextMenu()
    }
    
    func setupNumQuestionsContextMenu() {
        
        let actionCode: UIActionHandler = { action in
            print(action.title)
        }
        
        numQuestionsButton.menu = UIMenu(children: [
            UIAction(title: "5", state: .on, handler: actionCode),
            UIAction(title: "10", handler: actionCode),
            UIAction(title: "20", handler: actionCode)
        ])
        
        numQuestionsButton.showsMenuAsPrimaryAction = true
        numQuestionsButton.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toGameScreen", sender: self)
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        tablesOf = Int(tablesOfStepper.value)
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController {
            if let destVC = navVC.viewControllers.first as? GameViewController {
                destVC.numQuestions = Int(numQuestionsButton.titleLabel?.text ?? "0")
                destVC.tablesOf = tablesOf
            }
        }
    }

}
