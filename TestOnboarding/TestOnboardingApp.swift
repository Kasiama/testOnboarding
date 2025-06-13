//
//  TestOnboardingApp.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import AVFoundation
import SwiftUI

@main
struct TestOnboardingApp: App {
    init() {
        setupAudioSession()
    }
    
    var body: some Scene {
        WindowGroup {
            RootCoordinator()
        }
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("error setup audioSession: \(error.localizedDescription)")
        }
    }
}
