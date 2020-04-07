//
//  DrawingBoardView.swift
//  Pixcan
//
//  Created by Student AM on 5/7/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import UIKit

class DrawingBoardView: UIView {
    
    var height = 16 // change later to dimensions of image
    var width = 16 // change later to dimensions of image
    var pixelSize : CGFloat = 20 // placeholder, calculate it later
    var pixelSpacing : CGFloat = 1 // white lines between cells
    let deadColor = UIColor.white.cgColor
    var paintColor = UIColor.red.cgColor
    var currentPoints = "x,y"
    

    // Only override draw() if you perform custom drawing.
    //An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print (rect)
        if height > width {
            initialize(height)
        }
        else{
            initialize(width)
        }
        print(pixelState)
        clearGrid(rect)
        
        if firstDraw == true {
            drawGrid(rect)
            firstDraw = false
        }
        else {
            drawGrid(rect)
        }
    }
    
    func initialize(_ length: Int) {
        if pixelState.count >= length {
            return
        }
        for _ in 0..<length {
            pixelState.append([])
        }
        for i in 0..<length {
            for _ in 0..<length {
                pixelState[i].append(0)
            }
        }
    }
    
    func toggleLocation (_ p: CGPoint) {
        let x = Int(floor(p.x / (pixelSize + pixelSpacing)))
        let y = Int(floor(p.y / (pixelSize + pixelSpacing)))
        print (x, y)
        // make sure the coordinates aren't out of bounds
        if x > width - 1 {
            return
        }
        else if y > height - 1 {
            return
        }
        
        //Checks if the selected Cell is a different paintcolor so it won't paint it white
        if findColor(x, y) == paintColor || findColor(x, y) == UIColor.white.cgColor  {
            pixelState[x][y] = 1 - pixelState[x][y]
        }
        //Delete the color if needed
        if findColor(x, y) != UIColor.white.cgColor {
        savedArtData.remove(at: findCoordinates(x, y))
        }
        
        if pixelState[x][y] == 1 {
            currentPoints = "\(x),\(y)"
        }
        else {
            currentPoints = ""
        }
    
        self.setNeedsDisplay()
    }
    
    func clearGrid(_ rect:CGRect) {
        // get drawing context
        let context = UIGraphicsGetCurrentContext()
        
        //set color and line width
        context?.setFillColor(UIColor.gray.cgColor)
        
        //draw
        context?.fill(rect)
    }
    
    func drawGrid(_ rect:CGRect) {
        pixelSize = (rect.width / CGFloat((width))) - pixelSpacing
        
        if height > width {
            for y in 0..<height {
                for x in 0..<width {
                    drawCell (x: x, y: y)
                }
            }
        }
        else {
            for x in 0..<width {
                for y in 0..<height {
                    drawCell (x: x, y: y)
                }
            }
        }
    }


    func drawCell (x : Int, y : Int) {
        // calculate the x and y coordinates
        // based on the grid location
        let xcoord = CGFloat(x) * (pixelSize + pixelSpacing)
        let ycoord = CGFloat(y) * (pixelSize + pixelSpacing)
        let r = CGRect(x: xcoord, y: ycoord, width: pixelSize, height: pixelSize)
        
        let context = UIGraphicsGetCurrentContext()
        //If it's not the first draw and the cell is already colored, we will not change the color
            if pixelState[x][y] == 0 {
                context?.setFillColor(deadColor)
            }
            else if firstDraw == false && currentPoints != "\(x),\(y)" {
                context?.setFillColor(findColor(x, y))
            }
            else if currentPoints == "\(x),\(y)" {
                context?.setFillColor(paintColor)
                changeColorData(x: x, y: y, color: paintColor)
            }
            context?.fill(r)
    }
    
    func clear() {
        for x in 0..<width {
            for y in 0..<height {
                pixelState[x][y] = 0
            }
        }
        savedArtData = []
        self.setNeedsDisplay()
    }
    
    func changeColorData (x : Int, y : Int, color : CGColor) {
        //Changes/Adds data about whether a Cell has been colored in,
        //also will be used to calculate results
        let b = findCoordinates(x, y)
        if b == -1 {
            savedArtData.append(ColorData(x: x, y: y, color: color))
        }
        else {
            savedArtData[b] = ColorData(x: x, y: y, color: color)
        }
    }
}
