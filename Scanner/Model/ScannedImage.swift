//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import Foundation
import SwiftData
@available(iOS 17.0, *)

@Model
class ScannedImage: Identifiable, Hashable {

    @Attribute(.unique) let id: String
    let imageName: String
    let path: String
    let dateScanned: Date
    var desc: String
    var tags: [String]

    init(id: String, imageName: String, path: String, dateScanned: Date, desc: String, tags: [String]) {
        self.id = id
        self.imageName = imageName
        self.path = path
        self.dateScanned = dateScanned
        self.desc = desc
        self.tags = tags
    }
    
}
