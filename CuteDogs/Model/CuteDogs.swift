//
//  CuteDogs.swift
//  CuteDogs
//
//  Created by Audrey Jiang on 2023-04-22.
//

import Foundation

struct CuteDogs: Codable {
    let type: String
    let dogs: String
    let name: String
}


let firstDog = CuteDogs(type: "general",
                   dogs: "Labradorretreiever",
                   name: "Labrador Retriever")

let secondDog = CuteDogs(type: "general",
                         dogs: "Germanshepherd",
                         name: "German Shepherd")

let thirdDog = CuteDogs(type: "general",
                        dogs: "Alaskanmalamute",
                        name: "Alaskan Malamute")

let fourthDog = CuteDogs(type: "general",
                         dogs: "Bordercollie",
                         name: "Border Collie")
