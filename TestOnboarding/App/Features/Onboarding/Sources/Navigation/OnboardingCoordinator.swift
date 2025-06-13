//
//  OnboardingCoordinator.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import SwiftUI

struct OnboardingCoordinator: View {
    
    var body: some View {
        /*
         Here we can add the logic of wich screen to show on onboarding like:
         
         switch onboardingCoordinatorVM.state {
         case .videos:
            OnboardingVideosViews()
         case .inputData:
            OnboardingInputDataView()
         }
         */
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
