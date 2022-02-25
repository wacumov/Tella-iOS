//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import Foundation

enum ProgressType {
    case percentage
    case number
}

protocol ImportFilesProgressProtocol {
    var progressType: ProgressType {get}
    var title: String {get}
    var progressMessage: String {get}
    var cancelTitle: String {get}
    var cancelMessage: String {get}
    var cancelButtonTitle: String {get}
}
