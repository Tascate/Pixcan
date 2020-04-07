//
//  TutorialViewController.swift
//  PixArt
//
//  Created by Student AM on 5/21/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var paintView: UIView!
    
    @IBOutlet weak var gridView: DrawingBoardView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.layer.magnificationFilter = kCAFilterNearest
        paintView.backgroundColor = UIColor.orange
        gridView.height = 8
        gridView.width = 8
        gridView.setNeedsDisplay()
        
        gridView.layer.borderWidth = 1
        gridView.layer.borderColor = UIColor.gray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
