//
//  RandomNumber.swift
//  Randomizer
//
//  Created by Alexey on 12.03.2022.
//

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
