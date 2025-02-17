//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import SwiftUI

struct FileItemsView: View {
    
    @EnvironmentObject var fileListViewModel : FileListViewModel
    var files : [VaultFile]
    
    private var gridLayout: [GridItem] {
        [GridItem(.adaptive(minimum: 80),spacing: 6)]
    }
    
    private var minHeight: CGFloat {
        return (UIScreen.screenWidth / 4) - 6
    }
    
    var body: some View {
        if fileListViewModel.viewType == .list {
            itemsListView
        } else {
            itemsGridView
        }
    }
    
    @available(iOS 14.0, *)
    var itemsGridView: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 6) {
                ForEach(files, id: \.self) { file in
                    FileGridItem(file: file)
                        .frame(minHeight: minHeight)
                }
            }.padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
        }
    }
    
    private var itemsListView: some View {
        ScrollView {
            LazyVStack(spacing: 1) {
                ForEach(files, id: \.self) { file in
                    FileListItem(file: file)
                        .frame(height: 60)
                }
            }
        }
    }
}

struct FileItemsView_Previews: PreviewProvider {
    static var previews: some View {
        FileItemsView(files: [VaultFile.stub(type: .folder),
                              VaultFile.stub(type: .folder)])
            .environmentObject(FileListViewModel.stub())
        
    }
}
