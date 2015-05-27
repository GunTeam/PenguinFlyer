//
//  Environment.swift
//  PenguinFlyer
//
//  Created by Jottie Brerrin on 5/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Environment:CCNode{
    
    var objectDistance:Float = 30
    var gameSpeed:Float?
    var delegate:TouchInteractionDelegate?
    
    convenience init (objectDistance:Float){
        self.init()
        self.objectDistance = objectDistance
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        NSLog("Environment Touch Began")
        delegate?.fly()
    }
    
    override func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        NSLog("Environment Touch Ended")
        delegate?.hold()
    }
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        NSLog("Environment Touch Moved")
        delegate?.tap()
    }
    

    
}

protocol TouchInteractionDelegate{
    func tap()
    func hold()
    func fly()
    
}

