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
    var gameObjects:NSMutableArray?
    var gameSpeed:Float?
    
    convenience init (objectDistance:Float){
        self.init()
        self.objectDistance = objectDistance
    }
    
    func addGameObject(){
        
    }
    
    
    func addGlacier(){
        
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
