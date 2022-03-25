//
//  AppViewState.swift
//  Tella
//
//  Created by Rance Tsai on 9/7/20.
//  Copyright © 2020 Anessa Petteruti. All rights reserved.
//

import SwiftUI

enum MainViewEnum {
    case MAIN, LOCK, UNLOCK
}

final class AppViewState: ObservableObject {
   
    var homeViewModel : MainAppModel?

    @Published private var viewStack = [MainViewEnum]()
    
    init() {
        self.resetApp()
    }
    
    var currentView: MainViewEnum {
        return viewStack.last ?? .LOCK
    }

    func navigateBack() {
        viewStack.removeLast()
    }

    func navigate(to view: MainViewEnum) {
        viewStack.append(view)
    }

    func resetToLock() {
        viewStack = [.LOCK]
    }

    func resetToUnlock() {
        homeViewModel = nil
        viewStack = [.UNLOCK]
    }


    func resetToMain() {
        homeViewModel = MainAppModel()
        viewStack = [.MAIN]
    }
    
    func resetToAudio() {
        viewStack = [.MAIN]
        
        homeViewModel?.selectedType = [.audio]
        homeViewModel?.showFilesList = true
    }
    
    func resetToImageAndVideo() {
        viewStack = [.MAIN]
        
        homeViewModel?.selectedType = [.image,.video]
        homeViewModel?.showFilesList = true
    }
    
    func resetApp() {
        AuthenticationManager().keysInitialized() ? self.resetToUnlock() : self.resetToLock()
    }
}

