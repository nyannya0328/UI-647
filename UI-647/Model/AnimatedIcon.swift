//
//  AnimatedIcon.swift
//  UI-647
//
//  Created by nyannyan0328 on 2022/08/18.
//

import SwiftUI
import Lottie

struct AnimatedIcon: Identifiable {
    var id = UUID().uuidString
    var tabIcont : Tab
    var lottieView : AnimationView
}

