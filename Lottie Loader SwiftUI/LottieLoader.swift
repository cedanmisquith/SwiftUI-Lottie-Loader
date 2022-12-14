//
//  LottieLoader.swift
//  Lottie Loader SwiftUI
//
//  Created by Cedan Misquith on 12/10/22.
//

import SwiftUI
import Lottie
 
struct LottieLoader: UIViewRepresentable {
    let lottieFile: String
    let animationView = AnimationView()
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        animationView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
