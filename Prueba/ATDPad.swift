//
//  ATDPad.swift
//  Prueba
//
//  Created by Alejandro Tami on 14/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

/* 
    This class, sets up the dpad, and divides it into 9 pieces, 4 of which will be used as directional
    keys. Each piece is a square with size 54x54
*/

import Foundation
import SpriteKit

class ATDPad: SKSpriteNode{
    
    enum padSections{
        case up, down, left, right, none
    }
    
    let textureImage = SKTexture(imageNamed: "dpad")
    let padSize = CGSize(width: 162.0, height: 162.0)
    var directionals = Dictionary<padSections,CGRect>()
    
    init (){
        
        super.init()
        self.zPosition = 1.0
        self.name = "vpad"
        self.position = CGPoint(x: 10.0 , y: 10.0)
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.texture = textureImage
      //  self.color = UIColor(white: 1.0, alpha: 0.0)
        
        let directionalSections = CGSize(width: self.size.width/3, height: self.size.height/3)
        
        // Dividing the pad
        
        directionals =
            [padSections.up : CGRect(origin: CGPoint(x: self.size.width / 3, y: (self.size.height / 3) * 2),
            size: directionalSections) ,
            padSections.down : CGRect(origin: CGPoint(x: (self.size.width / 3), y: 0.0 ),
            size: directionalSections) ,
            padSections.left : CGRect(origin: CGPoint(x: 0.0, y: self.size.height / 3),
            size: directionalSections) ,
            padSections.right : CGRect(origin: CGPoint(x: (self.size.width / 3) * 2 , y: self.size.height / 3),
            size: directionalSections)]
        
//        let upNode = SKShapeNode(rect: directionals[padSections.up]!)
//        let downNode = SKShapeNode(rect: directionals[padSections.down]!)
//        let leftNode = SKShapeNode(rect: directionals[padSections.left]!)
//        let rightNode = SKShapeNode(rect: directionals[padSections.right]!)
//        
//        
//        upNode.fillColor = UIColor.redColor()
//        downNode.fillColor = UIColor.whiteColor()
//        leftNode.fillColor = UIColor.blueColor()
//        rightNode.fillColor = UIColor.greenColor()
//        
//        self.addChild(upNode)
//        self.addChild(downNode)
//        self.addChild(leftNode)
//        self.addChild(rightNode)

    }

    
    init(texture:SKTexture, color:SKColor, size:CGSize) {
        super.init(texture:textureImage, color:color, size:padSize)
    }
    
    func receiveTouch(touch: UITouch, scene: SKScene) -> padSections
    {

        let location = touch.locationInNode(scene)
        let node = scene.nodeAtPoint(location)
        var touchedDirectional = padSections.none
        
        if node is ATDPad
        {
            let locationInPad = touch.locationInNode(node)
            
            if CGRectContainsPoint(directionals[padSections.up]! , locationInPad) {
                touchedDirectional = padSections.up
                println("UP \(locationInPad)")
            } else if CGRectContainsPoint(directionals[padSections.down]! , locationInPad) {
                touchedDirectional = padSections.down
                println("DOWN \(locationInPad)")
            } else if CGRectContainsPoint(directionals[padSections.left]! , locationInPad){
                touchedDirectional = padSections.left
                println("LEFT \(locationInPad)")
            } else if CGRectContainsPoint(directionals[padSections.right]! , locationInPad){
                touchedDirectional = padSections.right
                println("RIGHT \(locationInPad)")
            }else {
                padSections.none
                println("ERROR, not directional \(locationInPad)")
            }
        
        }
        
        return touchedDirectional
    }
    
    
    
    
    

}
                                                                                                                                                