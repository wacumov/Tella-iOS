//
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI
import UniformTypeIdentifiers

struct HomeView: View {
    
    @EnvironmentObject var appModel: MainAppModel
    @StateObject var viewModel : HomeViewModel
    
    init(appModel: MainAppModel) {
        _viewModel = StateObject(wrappedValue: HomeViewModel(appModel: appModel))
    }
    
    var body: some View {
        
        ContainerView {
            VStack() {
                
                if appModel.settings.showRecentFiles {
                    Spacer()
                        .frame( height: viewModel.getFiles().count > 0 ? 16 : 0 )
                    RecentFilesListView(recentFiles: viewModel.getFiles())
                }
                
                Spacer()
                    .frame(height: 30)
                
                FileGroupsView(shouldShowFilesTitle: viewModel.showingFilesTitle)
                
                if appModel.settings.quickDelete {
                    SwipeToActionView(completion: {
                        appModel.removeAllFiles()
                    })
                }
            }
        }
        .navigationBarTitle(LocalizableHome.appBar.localized, displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView(appModel: MainAppModel())
    }
}
