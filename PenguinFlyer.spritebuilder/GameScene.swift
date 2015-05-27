//
//  GameScene.swift
//  PenguinFlyer
//
//  Created by Jottie Brerrin on 5/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class GameScene:CCNode,TouchInteractionDelegate{
    
    var _environment:Environment!
    var _penguin:Penguin!
    var _physicsNode:CCPhysicsNode!
    var _followerNode:CCNode!
    
    var maxHeight:CGFloat?
    var minHeight:CGFloat?
    
    func didLoadFromCCB(){
        self.userInteractionEnabled = true
        _penguin.velocity = 1
        _physicsNode.debugDraw = true
        _environment.delegate = self
        _environment.userInteractionEnabled = true
        
        //for debug purposes
        _penguin.physicsBody.velocity = CGPointMake(0, -100)

    }
    
    override func onEnter() {
//        set bounds for environment height
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let environmentHeight = _environment.contentSizeInPoints.height
        let startY = _environment.positionInPoints.y
        
        maxHeight = startY + environmentHeight/2.25
        minHeight = startY - environmentHeight/2.25

        
        var follow = CCActionFollow(target: _penguin, worldBoundary: CGRectMake(0, startY - environmentHeight/2, screenWidth, screenHeight*3.5))
        runAction(follow)

        super.onEnter()
    }

    override func update(delta: CCTime) {
        
        NSLog("Penguin Position = %f", _penguin.position.y)
        
        if (_penguin.position.y < minHeight && _penguin.physicsBody.velocity.y < 0) || (_penguin.position.y > maxHeight && _penguin.physicsBody.velocity.y > 0) {
            _penguin.physicsBody.velocity = CGPointMake(0, 0)
        }
        
    }
    
    func fly() {
        NSLog("FLY!")
        _penguin.physicsBody.velocity = CGPointMake(0, -_penguin.physicsBody.velocity.y)

    }
    func tap() {
        NSLog("TAP!")
    }
    func hold() {
        NSLog("HOLD!")
    }
    
}