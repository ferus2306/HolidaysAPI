//
//  Holiday.swift
//  API practice
//
//  Created by Firus Hanov on 11/12/19.
//  Copyright © 2019 Firus Hanov. All rights reserved.
//

import Foundation


struct HolidaysResponse:Decodable {
    var response: Holidays
}


struct Holidays:Decodable {
    var holidays:[HolidayDetail]
}


struct HolidayDetail: Decodable {
    var name:String
    var date:DateInfo
}


struct DateInfo:Decodable {
    var iso:String
    
}
