//
//  DataHelper.swift
//  MapCluster
//
//  Created by Rashwan Lazkani on 2018-11-06.
//  Copyright © 2018 Rashwan Lazkani. All rights reserved.
//

import Foundation

struct DataHelper {
    static func getMarkers() -> Markers? {
        guard let url = Bundle.main.url(forResource: "locations", withExtension: "json") else { fatalError("Couldn't find local resource locations.json.") }
        do {
            let data = try Data(contentsOf: url)
            let locations = try JSONDecoder().decode(Markers.self, from: data)
            return locations
        } catch {
            print(error)
            return nil
        }
    }
}
