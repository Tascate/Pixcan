//
//  DrawViewController.swift
//  Pixcan
//
//  Created by Student AM on 5/7/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    @IBOutlet weak var drawingButtonStack: UIStackView!
    @IBOutlet weak var pixelImage: UIButton!
    @IBOutlet weak var drawingView: DrawingBoardView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var drawBoardLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var drawBoardBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var drawBoardTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var drawBoardRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var drawBoardHeight: NSLayoutConstraint!
    @IBOutlet weak var drawBoardWidth: NSLayoutConstraint!
    
    var finish = 1
    
    @IBOutlet var colorButtons: [UIButton]!
    var selectedButton = UIButton()
    
    var selectedArt = artData[0] // change later, to image
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupButtons()
        setupImage()
        setupDrawBoard()
        drawingView.setNeedsDisplay()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / drawingView.bounds.width
        let heightScale = size.height / drawingView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupButtons() {
        drawingButtonStack.frame.size.width = view.frame.width - pixelImage.frame.width
        drawingButtonStack.frame.size.height = pixelImage.frame.height
        
        //Set each button's colors depending on the current Art selected
        for i in 0...11 {
            let b = colorButtons[i].tag
            colorButtons[i].backgroundColor = selectedArt.colors[b]
        }
        let firstButton = findButton(0)
        changeBrush(colorButtons[firstButton])
        
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor(red:71/255, green: 161/255, blue: 255/55, alpha: 1).cgColor
        finishButton.layer.borderWidth = 1
        finishButton.layer.borderColor = UIColor(red:71/255, green: 161/255, blue: 255/55, alpha: 1).cgColor
    }
    
    func setupImage() {
        pixelImage.setImage(selectedArt.image, for: .normal)
        pixelImage.contentVerticalAlignment = UIControlContentVerticalAlignment.fill
        pixelImage.contentHorizontalAlignment = UIControlContentHorizontalAlignment.fill
        pixelImage.imageView?.contentMode = .scaleAspectFit
        pixelImage.imageView?.layer.magnificationFilter = kCAFilterNearest
    }
    
    func setupDrawBoard() {
        //Make the Drawing Board the correct size
        drawingView.height = selectedArt.height
        drawingView.width = selectedArt.width
        
        if view.frame.height >= 768 || view.frame.height >= 1024 {
            drawBoardHeight.constant = 1.5 * view.frame.height
            drawBoardWidth.constant = drawBoardHeight.constant
        }
        
        if drawingView.height != drawingView.width {
            let artWidth = drawingView.width
            let artHeight = drawingView.height
            if artHeight > artWidth{
                drawBoardWidth.constant = CGFloat(round((Double(drawBoardHeight.constant) / Double(artHeight))) * Double(artWidth))
            }
            else {
                drawBoardHeight.constant = CGFloat(round((Double(drawBoardWidth.constant) / Double(artWidth))) * Double(artHeight))
            }
        }
        updateConstraintsForSize(view.bounds.size)
        
        drawingView.layer.borderWidth = 1
        drawingView.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func changeBrush(_ sender: UIButton) {
        //Changes the current brush and selected button
        let b = sender.tag
        let c = selectedArt.colors[b]
        let button = findButton(b)
        drawingView.paintColor = c.cgColor
        changeButton(colorButtons[button])
    }
    
    func changeButton(_ button: UIButton) {
        //Switches the visual indicator to the new selected Button
        selectedButton.layer.borderWidth = 0
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        selectedButton = button
    }
    
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: drawingView)
        drawingView.toggleLocation(point)
    }
    
    func findButton(_ tag: Int) -> Int {
        for i in 0...11 {
            if tag == colorButtons[i].tag {
                return i
            }
        }
        return 0
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        finish = 0
    }
    @IBAction func finishDrawing(_ sender: UIButton) {
        finish = 1
    }
    @IBAction func checkDrawing(_ sender: UIButton) {
        finish = 2
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if finish == 1{
            let dest = segue.destination as! ResultsViewController
            dest.selectedArt = selectedArt
            firstDraw = false
        }
        else if finish == 0 {
            savedArtData = []
            pixelState = []
        }
        else if finish == 2 {
            let dest = segue.destination as! ImageViewController
            dest.imageHeight = scrollView.frame.size.width
            dest.imageWidth = scrollView.frame.size.width
            dest.selectedArt = selectedArt
            if drawingView.height != drawingView.width {
                let artWidth = drawingView.width
                let artHeight = drawingView.height
                if artHeight > artWidth{
                    dest.imageWidth = CGFloat((Double(dest.imageHeight) / Double(artHeight)) * Double(artWidth))
                }
                else {
                    dest.imageHeight = CGFloat((Double(dest.imageWidth) / Double(artWidth)) * Double(artHeight))
                }
            }
        }
    }
    
    @IBAction func unwindToDrawScreen(sender: UIStoryboardSegue)
    {
        _ = sender.source
        // Pull any data from the view controller which initiated the unwind segue.
    }
}

extension DrawViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return drawingView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
    
    func updateConstraintsForSize(_ size: CGSize) {
        
        let yOffset = max(0, (size.height - drawingView.frame.height) / 3)
        drawBoardTopConstraint.constant = yOffset
        drawBoardBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width - drawingView.frame.width) / 3)
        drawBoardLeftConstraint.constant = xOffset
        drawBoardRightConstraint.constant = xOffset
        
        view.layoutIfNeeded()
    }
}
