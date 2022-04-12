//
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI
import UniformTypeIdentifiers

class HomeViewModel: ObservableObject {
    @Published var showingDocumentPicker = false
    @Published var showingAddFileSheet = false
}

struct HomeView: View {
    
    @EnvironmentObject var appModel: MainAppModel
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ContainerView {
            VStack(spacing: 30) {
                
                VStack(spacing: 15) {
                    if appModel.settings.showRecentFiles {
                        Spacer()
                            .frame( height: appModel.vaultManager.recentFiles.count > 0 ? 15 : 0 )
                        RecentFilesListView()
                    }
                }
                
                FileGroupsView()
                
                if appModel.settings.quickDelete {
                    SwipeToActionView(completion: {
                        appModel.removeAllFiles()
                    })
                }
            }
        }
        .navigationBarTitle("Tella", displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
