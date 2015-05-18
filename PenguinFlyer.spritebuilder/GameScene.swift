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
    var _followerNode:CCNode!
    
    var maxHeight:CGFloat?
    var minHeight:CGFloat?
    
    func didLoadFromCCB(){
        self.userInteractionEnabled = true
        _penguin.velocity = 1
        _physicsNode.debugDraw = true
        
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
        
        var follow = CCActionFollow(target: _penguin, worldBoundary: CGRectMake(0, startY - environmentHeight/2, screenWidth, screenHeight*3.5))
        runAction(follow)

        super.onEnter()
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        NSLog("touch began")
        _penguin.physicsBody.velocity = CGPointMake(0, -_penguin.physicsBody.velocity.y)
    }

    override func update(delta: CCTime) {
        
    }

    
}