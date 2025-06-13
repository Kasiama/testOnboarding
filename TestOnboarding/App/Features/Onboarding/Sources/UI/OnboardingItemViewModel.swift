//
//  OnboardingViewModel.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import AVKit
import Combine
import SwiftUI

class OnboardingItemViewModel: ObservableObject {
    // 2nd vido is broken in the end.
    // that's why we need to deny AVQueuePlayer and AVPlayerLooper
    // AVPlayerLooper may be crashed after 3-4 runs the broken video in a row
    private var player: AVPlayer?
    private var observers: [NSObjectProtocol] = []
    let pageIndex: Int
    @Binding var currentPage: Int
    
    init(videoName: String, pageIndex: Int, currentPage: Binding<Int>) {
        self.pageIndex = pageIndex
        self._currentPage = currentPage
        setupPlayer(for: videoName)
    }
    
    private func setupPlayer(for videoName: String) {
        guard let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") else { return }
        
        let playerItem = AVPlayerItem(url: url)
        self.player = AVPlayer(playerItem: playerItem)
        self.player?.isMuted = false
        
        self.observers.append(
            NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: playerItem,
            queue: .main
            ){ [weak self] _ in
                guard let self = self else { return }
                self.player?.seek(to: .zero)
                self.player?.play()
            }
        )

        self.observers.append(
            NotificationCenter.default.addObserver(
                forName: UIApplication.didBecomeActiveNotification,
                object: nil,
                queue: .main
            ){ [weak self] _ in
                guard let self = self else { return }
                if self.pageIndex == self.currentPage {
                    self.player?.play()
                }
            }
        )
    }
    
    func getPlayer() -> AVPlayer? {
        return player
    }
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    deinit {
        pause()
        for observer in self.observers {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
