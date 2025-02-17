//  Tella
//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    var appModel: MainAppModel
    
    @Published var showingDocumentPicker = false
    @Published var showingAddFileSheet = false
    var hasRecentFile = false
    
    var showingFilesTitle: Bool {
        return hasRecentFile && appModel.settings.showRecentFiles
    }
    
    init(appModel:MainAppModel) {
        self.appModel = appModel
    }
    
    func getFiles() -> [RecentFile] {
        let recentFile = appModel.vaultManager.root.getRecentFile()
        hasRecentFile = recentFile.count > 0
        return recentFile
    }
}
