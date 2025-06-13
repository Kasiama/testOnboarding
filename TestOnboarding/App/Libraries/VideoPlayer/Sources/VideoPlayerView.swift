//
//  VideoPlayerView.swift
//  TestOnboarding
//
//  Created by Ivan Zhuravskiy on 6/12/25.
//

import AVKit
import SwiftUI

struct VideoPlayerView: UIViewRepresentable {
    let player: AVPlayer?
    
    func makeUIView(context: Context) -> UIView {
        let view = PlayerView()
        view.player = player
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
