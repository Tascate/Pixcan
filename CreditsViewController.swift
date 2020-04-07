//
//  CreditsViewController.swift
//  PixArt
//
//  Created by Student AM on 5/21/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {
    
    var index = 0
    var currentLink = ""

    @IBOutlet weak var imageArt: UIImageView!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    
    @IBOutlet weak var mainMenuButton: UIButton!
    @IBOutlet weak var rightArrowButton: UIButton!
    @IBOutlet weak var leftArrowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateInformation()
        // Do any additional setup after loading the view.
        linkButton.layer.cornerRadius = linkButton.frame.height / 5
        leftArrowButton.layer.cornerRadius = leftArrowButton.frame.height / 5
        rightArrowButton.layer.cornerRadius = rightArrowButton.frame.height / 5
        mainMenuButton.layer.cornerRadius = mainMenuButton.frame.height / 5
        imageArt.layer.borderWidth = 1
        imageArt.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateInformation() {
        imageArt.image = artData[index].image
        imageArt.layer.magnificationFilter = kCAFilterNearest
        licenseLabel.text = artData[index].license
        authorLabel.text = "Created by \(artData[index].author)"
        currentLink = artData[index].link
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        index += 1
        index %= artData.count
        updateInformation()
    }
    
    @IBAction func backImage(_ sender: UIButton) {
        index -= 1
        index += artData.count
        index %= artData.count
        updateInformation()
    }

    @IBAction func openLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: currentLink)!, options: [:], completionHandler: nil)
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
