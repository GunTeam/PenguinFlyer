//
//  Penguin.swift
//  PenguinFlyer
//
//  Created by Jottie Brerrin on 5/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Penguin: CCSprite {
    
    var height:Float = 0
    var velocity:Float = 0
    
    convenience init(height:Float,velocity:Float){
        self.init()
        self.height = height
        self.velocity = velocity
    }
}