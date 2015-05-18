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
    
    var maxHeight:CGFloat?
    var minHeight:CGFloat?
    
    func didLoadFromCCB(){
        self.userInteractionEnabled = true
        _penguin.velocity = 5

    }
    
    override func onEnter() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
    
        let environmentHeight = _environment.contentSizeInPoints.height
        
        let startY = _environment.positionInPoints.y
        
        let maxMove = environmentHeight/2 - screenHeight
        maxHeight = (startY - maxMove) - startY
        minHeight = (startY + maxMove) + startY
        
//        _environment.positionInPoints = CGPointMake(_environment.positionInPoints.x, maxHeight!)
    
        NSLog("max height = %f , min height = %f , max move = %f , screen height = %f , start y = %f , environment height = %f", Float(maxHeight!),Float(minHeight!),maxMove,screenHeight,startY,environmentHeight)
        super.onEnter()
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
    }
    
    func TogglePenguinSpeed(){
        _penguin.velocity = -_penguin.velocity
    }
    
    override func update(delta: CCTime) {
        updateEnvironment()
        
    }
    
    func updateEnvironment(){
        var nextEnvironmentPosition = _environment.positionInPoints.y - _penguin.velocity
        if nextEnvironmentPosition < maxHeight {
            _environment.positionInPoints = CGPointMake(_environment.positionInPoints.x, maxHeight!)
        } else if nextEnvironmentPosition > minHeight {
            _environment.positionInPoints = CGPointMake(_environment.positionInPoints.x, minHeight!)
        } else{
            _environment.positionInPoints = CGPointMake(_environment.positionInPoints.x, _environment.positionInPoints.y - _penguin.velocity)
        }
        
    }

    
}