//
//  BallNode.swift
//  Ball
//
//  Created by Robson Cassol on 22/09/15.
//  Copyright © 2015 cassol. All rights reserved.
//

import Foundation
import SpriteKit

class BallNode: SKSpriteNode, SKPhysicsContactDelegate {

    
    class func ball(location: CGPoint) -> BallNode {
     
        let sprite = BallNode(imageNamed:"ball")
        
        sprite.position = location
        sprite.name = "ball"
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "ball"), size: sprite.size)
      
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.dynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        
        return sprite
    }
    
}