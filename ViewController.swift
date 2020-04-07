//
//  ViewController.swift
//  PixArt
//
//  Created by Student AM on 5/21/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    
    let topColor = UIColor.magenta
    let bottomColor = UIColor.purple
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupButtons()
        
        for sv in stackView.subviews {
            if sv is UIButton {
                sv.layer.cornerRadius = sv.frame.height / 5
                let b = sv as! UIButton
                b.titleLabel?.font = UIFont(name: (b.titleLabel?.font.fontName)!, size: b.frame.height * 0.5)
                
                //add gradient
                let gl = CAGradientLayer()
                gl.colors = [ topColor,bottomColor ]
                gl.locations = [ 0, 1 ]
                gl.frame.size.width = b.frame.width
                gl.frame.size.height = b.frame.height
                b.layer.addSublayer(gl)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupButtons() {
        if view.frame.width > view.frame.height {
            stackViewWidth.constant = view.frame.width / 2
            stackViewHeight.constant = view.frame.height * 0.9
        }
        else {
            stackViewWidth.constant = view.frame.width * 2/3
            stackViewHeight.constant = view.frame.height * 1.2/3
        }
    }

    
    @IBAction func unwindToHomeScreen(sender: UIStoryboardSegue)
    {
        _ = sender.source
        // Pull any data from the view controller which initiated the unwind segue.
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
