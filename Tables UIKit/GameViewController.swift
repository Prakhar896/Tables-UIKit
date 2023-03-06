//
//  GameViewController.swift
//  Tables UIKit
//
//  Created by Prakhar Trivedi on 6/3/23.
//

import UIKit

class GameViewController: UIViewController {
    
    var tablesOf: Int? = nil
    var numQuestions: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if tablesOf == nil {
            let alert = UIAlertController(title: "Failed to get settings.", message: "We could not load your game settings. Please try again.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.dismiss(animated: true)
            }
            
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        
        title = "Tables of \(tablesOf!)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
