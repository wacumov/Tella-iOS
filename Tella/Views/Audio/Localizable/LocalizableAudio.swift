//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import Foundation

enum LocalizableAudio: String, LocalizableDelegate {
    
    case recorderTitle = "AudioRecorderTitle"
    case suffixRecordingName = "AudioSuffixRecordingName"

    case  saveRecordingTitle = "AudioSaveRecordingTitle"
    case  saveRecordingMessage = "AudioSaveRecordingMessage"
    
    case  renameFileTitle = "AudioRenameFileTitle"

    case  recordingSavedMessage = "AudioRecordingSavedMessage"

    
    var tableName: String? {
        return "Audio"
    }
}


