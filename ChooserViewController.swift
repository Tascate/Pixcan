//
//  ChooserViewController.swift
//  Pixcan
//
//  Created by Student AM on 5/7/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

class ChooserViewController: UIViewController {
    
    var segueIndex = 0

    @IBOutlet var chooserButtons: [UIButton]!
    @IBOutlet weak var mainMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupButtons() {
        for i in 0..<chooserButtons.count {
            chooserButtons[i].contentVerticalAlignment = UIControlContentVerticalAlignment.fill
            chooserButtons[i].contentHorizontalAlignment = UIControlContentHorizontalAlignment.fill
            chooserButtons[i].imageView?.contentMode = .scaleAspectFit
            chooserButtons[i].imageView?.layer.magnificationFilter = kCAFilterNearest
            chooserButtons[i].layer.borderWidth = 0.7
            chooserButtons[i].layer.borderColor = UIColor(red:71/255, green: 161/255, blue: 255/55, alpha: 1).cgColor
        }
        mainMenuButton.layer.borderWidth = 1
        mainMenuButton.layer.borderColor = UIColor(red:71/255, green: 161/255, blue: 255/55, alpha: 1).cgColor
    }
    
    
    @IBAction func gotoDrawingBoard(_ sender: UIButton) {
        segueIndex = 0
    }
    
    
    @IBAction func goBackToMainMenu(_ sender: UIButton) {
        segueIndex = 1
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segueIndex == 0 {
        let dest = segue.destination as! DrawViewController
        let b = sender as! UIButton
        dest.selectedArt = artData[b.tag]
        }
        else {
            return
        }
    }
    
    @IBAction func unwindToChoiceScreen(sender: UIStoryboardSegue)
    {
        _ = sender.source
        // Pull any data from the view controller which initiated the unwind segue.
    }

}
