//
//  GameScene.swift
//  PenguinFlyer
//
//  Created by Jottie Brerrin on 5/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class GameScene:CCNode,TouchInteractionDelegate{
    
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
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
        _environment.userInteractionEnabled = true
        _environment.delegate = self
        _environment.userInteractionEnabled = true
        
        //for debug purposes
        _penguin.physicsBody.velocity = CGPointMake(0, -100)

    }
    
    override func onEnter() {
//        set bounds for environment height
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        let environmentHeight = _environment.contentSizeInPoints.height
        let startY = _environment.positionInPoints.y
                
        maxHeight = startY + environmentHeight/2.25
        minHeight = startY - environmentHeight/2.25
        
        var follow = CCActionFollow(target: _penguin, worldBoundary: CGRectMake(0, startY - environmentHeight/2, screenWidth!, screenHeight!*3.5))
        runAction(follow)
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("addGlacier"), userInfo: nil, repeats: false)

        

        super.onEnter()
    }

    override func update(delta: CCTime) {        
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
    
    func addGameObject(){
        
    }
    
    func addGlacier(){
        var ice = CCBReader.load("ProtoIce")
        ice.physicsBody.velocity = CGPointMake(-100, 0)
        ice.position = CGPointMake(screenWidth! + ice.contentSizeInPoints.width/2, 0)
        _physicsNode.addChild(ice)
    }
    func addPolarBear(){
        
    }
    func addWalrus(){
        
    }
    func addRamp(){
        
    }
    func addFish(){
        
    }
    
}