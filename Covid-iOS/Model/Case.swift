//
//  Case.swift
//  Covid-iOS
//
//  Created by Avijeet Sachdev on 6/30/20.
//  Copyright © 2020 Avijeet Sachdev. All rights reserved.
//

import Foundation

struct Case: Decodable {
    let state: String
    let total: Int
    let positive: Int
    let death: Int
    let hospitalized: Int?
}
