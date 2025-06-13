//
//  RootCoordinator.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import SwiftUI

struct RootCoordinator: View {
    var body: some View {
        NavigationView {
            // here we can manage which coordinator to show, for example:
            /*
             switch rootCoordinatorVM.state {
             case .main:
                MainCoordinator()
             case .onboarding:
                OnboardingCoordinator()
             }
             */
            OnboardingCoordinator()
        }
    }
}
