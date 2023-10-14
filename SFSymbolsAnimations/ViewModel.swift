//
//  ViewModel.swift
//  SF Symbols animations
//
//  Created by Maor on 14/10/2023.
//

import Foundation
import SFSafeSymbols

struct ViewModel {
    let symbol: SFSymbol
    let color: UIColor?
}


struct EffectStore {
    var pulseEffect: [PulseEffect: Bool] = [:]
    var bounceEffect: [BounceEffect: Bool] = [:]
    var appearEffect: [AppearEffect: Bool] = [:]
    var disappearEffect: [DisappearEffect: Bool] = [:]
    var scaleEffect: [ScaleEffect: Bool] = [:]
    var variableColorEffect: [VariableColorEffect: Bool] = [:]
    
}
