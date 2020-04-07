//
//  ImageViewController.swift
//  PixArt
//
//  Created by Student AM on 5/18/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageHeight = CGFloat()
    var imageWidth = CGFloat()
    var selectedArt = artData[0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupImageView() {
        imageViewHeight.constant = imageHeight
        imageViewWidth.constant = imageWidth
        imageView.image = selectedArt.image
        imageView.layer.magnificationFilter = kCAFilterNearest
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dest = segue.destination as! DrawViewController
        dest.selectedArt = selectedArt
        firstDraw = false
    }


}
