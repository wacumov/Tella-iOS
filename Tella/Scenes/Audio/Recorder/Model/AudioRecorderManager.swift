//
//  AudioManager.swift
//  Tella
//
//  Created by Bruno Pastre on 12/10/20.
//  Copyright © 2020 Anessa Petteruti. All rights reserved.
//

import Foundation

protocol AudioRecorderManager {
    func startRecording()
    func pauseRecording()
    func stopRecording(fileName:String)
    func resetRecorder()
    
    func playRecord()
    func pauseRecord()
}
