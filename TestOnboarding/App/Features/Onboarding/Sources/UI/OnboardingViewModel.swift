//
//  OnboardingViewModel.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPage = 0
    let items = [
        OnboardingItem(videoName: "video1", title: "Welcome!"),
        OnboardingItem(videoName: "video2", title: "Main opportunities!"),
        OnboardingItem(videoName: "video3", title: "Start using the app!")
    ]
}
