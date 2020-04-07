//
//  ResultsViewController.swift
//  Pixcan
//
//  Created by Student AM on 5/7/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

extension UIImage {
        func getPixelColor(pos: CGPoint) -> UIColor {
            let pixelData = self.cgImage!.dataProvider!.data
            let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
            
            let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
            
            let r = CGFloat(data[pixelInfo]) / 255
            let g = CGFloat(data[pixelInfo+1]) / 255
            let b = CGFloat(data[pixelInfo+2]) / 255
            let a = CGFloat(data[pixelInfo+3]) / 255
            
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
    }


class ResultsViewController: UIViewController {
    
    var selectedArt = artData[5]
    @IBOutlet weak var minatureDrawingBoard: DrawingBoardView!
    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var fractionLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var miniDrawingBoardHeight: NSLayoutConstraint!
    @IBOutlet weak var miniDrawingBoardWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        miniDrawingBoardHeight.constant = 0.50 * view.frame.height
        miniDrawingBoardWidth.constant = miniDrawingBoardHeight.constant
        recreateDrawing()
        getResults()
        finishButton.layer.cornerRadius = finishButton.frame.height / 5
        // Do any additional setup after loading the view.
        minatureDrawingBoard.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func recreateDrawing() {
        minatureDrawingBoard.height = selectedArt.height
        minatureDrawingBoard.width = selectedArt.width
        
        if minatureDrawingBoard.height != minatureDrawingBoard.width {
            let artWidth = minatureDrawingBoard.width
            let artHeight = minatureDrawingBoard.height
            if artHeight > artWidth{
                miniDrawingBoardWidth.constant = CGFloat((Double(miniDrawingBoardHeight.constant) / Double(artHeight)) * Double(artWidth))
            }
            else {
                miniDrawingBoardHeight.constant = CGFloat((Double(miniDrawingBoardWidth.constant) / Double(artWidth)) * Double(artHeight))
            }
        }
        
        
        minatureDrawingBoard.layer.borderWidth = 1
        minatureDrawingBoard.layer.borderColor = UIColor.gray.cgColor
    }
    
    func getResults() {
        let height = selectedArt.height
        let width = selectedArt.width
        let correctPixelCount = getComparison(selectedArt)
        let pixelAmount = height * width
        
        let decimalPercentage = Double(correctPixelCount) / Double(pixelAmount)
        let percentageCorrect = Double(round(1000*decimalPercentage)/1000) * 100
        print(decimalPercentage)
        print(percentageCorrect)
        
        changeDisplayLabels(correctPixelCount, pixelAmount, percentageCorrect)
    }
    
    func getComparison(_ art: PixelArt) -> Int {
        let height = art.height
        let width = art.width
        var correctComparisons = 0
        
        //Compares each pixel of the image to the user-created image, each correct comparison adds a point
        for x in 0..<(height-1) {
            for y in 0..<(width-1) {
                let point = CGPoint(x: x, y: y)
                var imageColor = art.image.getPixelColor(pos: point).cgColor
                let drawColor = findColor(x, y)
                // If Pixel is blank/transparent, change it to white for the comparison
                if imageColor == UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor {
                    imageColor = UIColor.white.cgColor
                }
                if imageColor == drawColor {
                    correctComparisons += 1
                }
            }
        }
        print(correctComparisons)
        return correctComparisons
    }
    
    func changeDisplayLabels(_ pixels: Int, _ maxPixels: Int, _ percentage: Double) {
        fractionLabel.text = "You managed to get \(pixels)/\(maxPixels) correct!"
        if savedArtData.isEmpty == true {
            percentLabel.text = "You didn't draw anything at all!"
            fractionLabel.alpha = 0
            resultsLabel.text = "Try drawing in the art next time."
        }
        else {
        percentLabel.text = "\(percentage)% Accurate"
        
        switch Int(floor(percentage/10)) {
        case 10:
            resultsLabel.text = "Nice! You perfectly drew the pixel art!"
        case 9,8,7:
            resultsLabel.text = "Don't worry! You're so close!"
        case 6,5,4:
            resultsLabel.text = "Keep on trying!"
        case 3,2,1:
            resultsLabel.text = "You're on your way to improvement!"
        default:
            resultsLabel.text = "Each try means you're learning!"
            }
        }
    }

    @IBAction func finishSequence(_ sender: Any) {
        savedArtData = []
        pixelState = []
        firstDraw = false
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
