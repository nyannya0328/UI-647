//
//  ResizebleLottieView.swift
//  UI-647
//
//  Created by nyannyan0328 on 2022/08/18.
//

import SwiftUI
import Lottie

struct ResizebleLottieView: UIViewRepresentable {
    
    var lottieView : AnimationView
    var color : SwiftUI.Color = .black
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        setUp(to: view)
        view.backgroundColor = .clear
        return view
        
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
        if let animationView = uiView.subviews.first(where: {view in
            
            view is AnimationView
        }) as? AnimationView{
            
            lottieView.logHierarchyKeypaths()
            
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            
            let fileKeyPath = AnimationKeypath(keys: ["**","Fill 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: fileKeyPath)
            
            let strokeyPath = AnimationKeypath(keys: ["**","Stroke 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeyPath)
            
        }
        
        
        
    }
    
    func setUp(to : UIView){
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        lottieView.backgroundColor = .clear
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let contains = [
        
        
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor),
        
        ]
        
        
        to.addSubview(lottieView)
        to.addConstraints(contains)
        
    }
}


