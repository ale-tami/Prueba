//
//  GameScene.swift
//  Prueba
//
//  Created by Alejandro Tami on 02/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
        
        let vpad = ATDPad()

        
        self.addChild(vpad)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        let pad = self.childNodeWithName("vpad") as ATDPad
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let node = self.nodeAtPoint(location)
            
            let touched : ATDPad.padSections = pad.receiveTouch(touch as UITouch, scene: self)
            
            if touched == ATDPad.padSections.up {
                
                println("parriba")
                
            }
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
        }
    }

   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
