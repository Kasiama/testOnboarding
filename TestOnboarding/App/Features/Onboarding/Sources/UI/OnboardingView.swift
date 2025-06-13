//
//  OnboardingView.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(Array(viewModel.items.enumerated()), id: \.element.id) { index, item in
                OnboardingItemView(
                    viewModel: OnboardingItemViewModel(
                        videoName: item.videoName,
                        pageIndex: index,
                        currentPage: $viewModel.currentPage
                    ),
                    item: item,
                    isLastItem: index == viewModel.items.count - 1,
                    currentPage: viewModel.currentPage,
                    pageIndex: index,
                    onNext: {
                        withAnimation {
                            if index < viewModel.items.count - 1 {
                                viewModel.currentPage = index + 1
                            } else {
                                print("Onboarding completed")
                            }
                        }
                    }
                )
                .tag(index)
            }
        }
        .ignoresSafeArea(.all)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(Color.black)
        .onDisappear {
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}
