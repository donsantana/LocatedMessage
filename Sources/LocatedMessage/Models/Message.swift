//
//  File.swift
//  
//
//  Created by Done Santana on 6/4/24.
//

import Foundation
import CoreLocation

struct LocatedMessage {
    var id: Int
    var senderId: Int
    var message: String
    var location: CLLocationCoordinate2D
}
