//
//  OnboardingView.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import SwiftUI

struct OnboardingItemView: View {
    @StateObject var viewModel: OnboardingItemViewModel
    let item: OnboardingItem
    let isLastItem: Bool
    let currentPage: Int
    let pageIndex: Int
    let onNext: () -> Void
    
    var body: some View {
        ZStack {
            VideoPlayerView(player: viewModel.getPlayer())
            
            VStack {
                Spacer()
                
                Text(item.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(isLastItem ? "Start" : "Next", action: onNext)
                    .font(.title)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(25)
                    .padding(.bottom, 50)
                    .shadow(radius: 10)
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            UIApplication.shared.isIdleTimerDisabled = true
            if currentPage == pageIndex {
                viewModel.play()
            }
        }
        .onChange(of: currentPage) { _, newValue in
            if newValue == pageIndex {
                viewModel.play()
            } else {
                viewModel.pause()
            }
        }
        .onDisappear {
            viewModel.pause()
        }
    }
}
