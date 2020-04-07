//
//  PixelInfo.swift
//  Pixcan
//
//  Created by Student AM on 5/3/18.
//  Copyright © 2018 Student AM. All rights reserved.
//

import Foundation
import UIKit

struct PixelArt {
    let name : String
    let image : UIImage
    let width : Int
    let height : Int
    let colors : [UIColor]
    let author : String
    let license : String
    let link : String
}

struct ColorData {
    let x : Int
    let y : Int
    let color : CGColor
}

let artData : [PixelArt] = [
    PixelArt(name: "Book",
             image: #imageLiteral(resourceName: "cherry"),
             width: 11,
             height: 13,
             colors: [UIColor(red:215/255, green:31/255, blue:21/255, alpha:1),
                      UIColor(red:123/255, green:18/255, blue:0.13/255, alpha:1.0),
                      UIColor(red:238/255, green:95/255, blue:87/255, alpha:1.0),
                      UIColor(red:170/255, green:24/255, blue:17/255, alpha:1.0),
                      UIColor(red:112/255, green:200/255, blue:32/255, alpha:1.0),
                      UIColor(red:81/255, green:145/255, blue:23/255, alpha:1.0),
                      UIColor(red:51/255, green:91/255, blue:15/255, alpha:1.0),
                      UIColor(red:215/255, green:31/255, blue:21/255, alpha:1),
                      UIColor(red:115/255, green:90/255, blue:64/255, alpha:1.0),
                      UIColor(red:77/255, green:60/255, blue:43/255, alpha:1.0),
                      UIColor(red:171/255, green:141/255, blue:107/255, alpha:1.0),
                      UIColor(red:0, green:0, blue:0, alpha:1.0)
                      ],
             author: "Joe Williamson",
             license: "Creative Commons License 0",
             link: "https://opengameart.org/content/roguelikerpg-items"
    ),
    PixelArt(name: "Birb",
             image: #imageLiteral(resourceName: "bird"),
             width: 16,
             height: 16,
             colors: [UIColor(red:223/255, green:171/255, blue:145/255, alpha:1.0),
                      UIColor(red:141/255, green:110/255, blue:99/255, alpha:1.0),
                      UIColor(red:109/255, green:76/255, blue:65/255, alpha:1.0),
                      UIColor(red:238/255, green:238/255, blue:238/255, alpha:1.0),
                      UIColor(red:120/255, green:92/255, blue:83/255, alpha:1.0),
                      UIColor(red:109/255, green:76/255, blue:65/255, alpha:1.0),
                      UIColor(red:93/255, green:64/255, blue:55/255, alpha:1.0),
                      UIColor(red:189/255, green:189/255, blue:189/255, alpha:1.0),
                      UIColor(red:33/255, green:33/255, blue:33/255, alpha:1.0),
                      UIColor(red:238/255, green:238/255, blue:238/255, alpha:1.0),
                      UIColor(red:189/255, green:189/255, blue:189/255, alpha:1.0),
                      UIColor(red:1, green:1, blue:1, alpha:1.0)],
             author: "Refuzzle",
             license: "Creative Commons License 0",
             link: "https://opengameart.org/content/winter-birds"
    ),
    PixelArt(name: "Chick",
             image: #imageLiteral(resourceName: "chick"),
             width:20,
             height:18,
             colors: [UIColor(red:239/255, green:150/255, blue:0, alpha:1.0),
                      UIColor(red:190/255, green:100/255, blue:0, alpha:1.0),
                      UIColor(red:231/255, green:228/225, blue:223/255, alpha:1.0),
                      UIColor(red:119/255, green:119/255, blue:119/255, alpha:1.0),
                      UIColor(red:231/255, green:219/255, blue:202/255, alpha:1.0),
                      UIColor(red:0.74, green:0.39, blue:0.09, alpha:1.0),
                      UIColor(red:231/255, green:219/255, blue:202/255, alpha:1.0),
                      UIColor(red:190/255, green:100/255, blue:0, alpha:1.0),
                      UIColor(red:119/255, green:119/255, blue:119/255, alpha:1.0),
                      UIColor(red:239/255, green:150/255, blue:0, alpha:1.0),
                      UIColor(red:1, green:1.00, blue:1.00, alpha:1.0),
                      UIColor(red:0, green:0, blue:0, alpha:1)
                      ],
             author: "AntumDeluge",
             license: "Creative Commons License 0",
             link: "https://opengameart.org/content/chick"
    ),
    PixelArt(name: "Sword",
             image: #imageLiteral(resourceName: "sword"),
             width: 16,
             height: 16,
             colors: [UIColor(red:106/255, green: 72/255, blue:33/255, alpha:1.0),
                      UIColor(red:222/255, green: 198/255, blue:136/255, alpha:1.0),
                      UIColor(red:238/255, green: 212/255, blue:145/255, alpha:1.0),
                      UIColor(red:255/255, green: 227/255, blue:155/255, alpha:1.0),
                      UIColor(red:225/255, green: 116/255, blue:116/255, alpha:1.0),
                      UIColor(red:167/255, green: 97/255, blue:97/255, alpha:1.0),
                      UIColor(red:255/255, green: 240/255, blue:0/255, alpha:1.0),
                      UIColor(red:1, green: 1, blue:1, alpha:1.0),
                      UIColor(red:208/255, green: 207/255, blue:206/255, alpha:1.0),
                      UIColor(red:171/255, green: 171/255, blue:171/255, alpha:1.0),
                      UIColor(red:1, green: 1, blue:1, alpha:1.0),
                      UIColor(red:1/255, green: 1/255, blue:1/255, alpha:1.0)],
             author: "Vollrat",
             license: "Creative Commons License 3",
             link: "https://opengameart.org/content/16x16-basic-sword-sprites"
        
    ),
    PixelArt(name: "boy",
             image: #imageLiteral(resourceName: "male"),
             width: 14,
             height: 16,
             colors: [UIColor(red:203/255, green: 9/255, blue:36/255, alpha:1.0),
                      UIColor(red:219/255, green: 91/255, blue:47/255, alpha:1.0),
                      UIColor(red:248/255, green: 166/255, blue:78/255, alpha:1.0),
                      UIColor(red:103/255, green: 97/255, blue: 95/255, alpha:1.0),
                      UIColor(red:57/255, green: 118/255, blue:255/255, alpha:1.0),
                      UIColor(red:14/255, green: 176/255, blue:200/255, alpha:1.0),
                      UIColor(red:17/255, green: 212/255, blue:241/255, alpha:1.0),
                      UIColor(red:240/255, green: 238/255, blue:236/255, alpha:1.0),
                      UIColor(red:72/255, green: 31/255, blue:13/255, alpha:1.0),
                      UIColor(red:181/255, green: 80/255, blue:34/255, alpha:1.0),
                      UIColor(red:1, green: 1, blue:1, alpha:1.0),
                      UIColor(red:20/255, green: 20/255, blue:20/255, alpha:1.0)],
             author: "Fleurman",
             license: "Creative Commons License 0",
             link: "https://opengameart.org/content/tiny-characters-set"
    ),
    PixelArt(name: "house",
             image: #imageLiteral(resourceName: "house"),
             width: 16,
             height: 16,
             colors: [UIColor(red:76/255, green: 76/255, blue:76/255, alpha:1.0),
                      UIColor(red:66/255, green: 29/255, blue:21/255, alpha:1.0),
                      UIColor(red:249/255, green: 200/255, blue:112/255, alpha:1.0),
                      UIColor(red:245/255, green: 170/255, blue:87/255, alpha:1.0),
                      UIColor(red:228/255, green: 140/255, blue:79/255, alpha:1.0),
                      UIColor(red:151/255, green: 117/255, blue:108/255, alpha:1.0),
                      UIColor(red:195/255, green: 188/255, blue:154/255, alpha:1.0),
                      UIColor(red:179/255, green: 155/255, blue:125/255, alpha:1.0),
                      UIColor(red:252/255, green: 222/255, blue:130/255, alpha:1.0),
                      UIColor(red:203/255, green: 9/255, blue:36/255, alpha:1.0),
                      UIColor(red:189/255, green: 110/255, blue:84/255, alpha:1.0),
                      UIColor(red:8/255, green: 8/255, blue:8/255, alpha:1.0),],
             author: "Pixel-Boy",
             license: "Creative Commons License 0",
             link: "http://opengameart.org/content/superpowers-assets-various-2d"
             )
]

var savedArtData : [ColorData] = []
var pixelState : [[Int]] = []
var firstDraw = true

func findPixelImage (_ image : String) -> Int {
    for i in 0..<artData.count {
        if image == artData[i].name {
            return i
        }
    }
    return 0
}

func findColor (_ x : Int,_ y: Int) -> CGColor {
    for i in 0..<savedArtData.count {
        if x == savedArtData[i].x && y == savedArtData[i].y {
            return savedArtData[i].color
        }
    }
    return UIColor.white.cgColor
}

func findCoordinates (_ x: Int, _ y: Int) -> Int {
    for i in 0..<savedArtData.count {
        if x == savedArtData[i].x && y == savedArtData[i].y {
            return i
        }
    }
    return -1
}



