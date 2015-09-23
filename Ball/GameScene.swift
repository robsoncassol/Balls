//
//  GameScene.swift
//  Ball
//
//  Created by Robson Cassol on 22/09/15.
//  Copyright (c) 2015 cassol. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let motionManager:CMMotionManager = CMMotionManager()

    override func didMoveToView(view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        motionManager.deviceMotionUpdateInterval = 0.025
        motionManager.startDeviceMotionUpdates()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
            var remove = false
            let location = touch.locationInNode(self)
            
            self.enumerateChildNodesWithName("ball", usingBlock: { (node, stop) -> Void in
                
                if node.name == "ball" && node.containsPoint(location) {
                    
                    self.removeChildrenInArray([node])
                    remove = true
                }
                
            })

            if !remove {
                
                let sprite = BallNode.ball(location)
                self.addChild(sprite)
                
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        
        
        if let gravity = motionManager.deviceMotion?.gravity {
            
            self.physicsWorld.gravity = CGVector(dx:gravity.y*10,dy:(-gravity.x*10))
            
        }
        
    }
}
