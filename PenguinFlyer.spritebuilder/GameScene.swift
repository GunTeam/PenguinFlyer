//
//  GameScene.swift
//  PenguinFlyer
//
//  Created by Jottie Brerrin on 5/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class GameScene:CCNode{
    
    var _environment:CCNode!
    var _penguin:Penguin!
    var _physicsNode:CCPhysicsNode!
    
    func didLoadFromCCB(){
        self.userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        NSLog("NS log works!")
        _environment.positionInPoints = CGPointMake(_environment.positionInPoints.x, _environment.positionInPoints.y + 1)
    }
    
    func TogglePenguinSpeed(){
        NSLog("Penguin speed toggled")
    }
    
    override func update(delta: CCTime) {
        //
    }
    
}