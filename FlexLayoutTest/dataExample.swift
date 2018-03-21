//
//  data.swift
//  FlexLayoutTest
//
//  Created by Kilian on 20.03.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import Foundation

struct dataExample {
    let name: String
    let date: String
    let viewButtonVisible: Bool
    let infoText: String
    let numberOfImage: Int
}

var dataExamples = [
    dataExample(name: "Hello aisdjfoi asdif asd iifoa eia ewia sodif oaidpof apowefo aweoif wiefop eof  asd asd ffea dfe e faf", date: "2018-17-12", viewButtonVisible: false, infoText: "Hello", numberOfImage: 0),
    dataExample(name: "Hello", date: "2018-17-12", viewButtonVisible: false, infoText: "Hello", numberOfImage: 1),
    dataExample(name: "", date: "2018-17-12", viewButtonVisible: true, infoText: "Hello", numberOfImage: 2),
    dataExample(name: "Hello", date: "2018-17-12", viewButtonVisible: false, infoText: "Hello", numberOfImage: 1)
]
