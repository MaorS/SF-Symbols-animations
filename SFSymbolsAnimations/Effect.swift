//
//  Effect.swift
//  Test
//
//  Created by Maor on 23/09/2023.
//

import Foundation
import SFSafeSymbols

protocol EffectProtocol {
    associatedtype V: SymbolEffect
    func value() -> V
}

enum PulseEffect: String, CaseIterable, EffectProtocol {
    case value = "pulse"
    case byLayer
    case wholeSymbol
    
    func value() -> PulseSymbolEffect {
        switch self {
        case .value:
            return .pulse
        case .byLayer:
            return .pulse.byLayer
        case .wholeSymbol:
            return .pulse.wholeSymbol
        }
    }
    
}

enum BounceEffect: String, CaseIterable, EffectProtocol {
    case value = "bounce"
    case up
    case down
    case byLayer
    case wholeSymbol
    
    func value() -> BounceSymbolEffect {
        switch self {
        case .value:
            return .bounce
        case .up:
            return .bounce.up
        case .down:
            return .bounce.down
        case .byLayer:
            return .bounce.byLayer
        case .wholeSymbol:
            return .bounce.wholeSymbol
        }
    }
}

enum AppearEffect: String, CaseIterable, EffectProtocol {
    case value = "appear"
    case up
    case down
    case byLayer
    case wholeSymbol
    
    func value() -> AppearSymbolEffect {
        switch self {
        case .value:
            return .appear
        case .up:
            return .appear.up
        case .down:
            return .appear.down
        case .byLayer:
            return .appear.byLayer
        case .wholeSymbol:
            return .appear.wholeSymbol
        }
    }
}

enum DisappearEffect: String, CaseIterable, EffectProtocol {
    case value = "disappear"
    case up
    case down
    case byLayer
    case wholeSymbol
    
    func value() -> DisappearSymbolEffect {
        switch self {
        case .value:
            return .disappear
        case .up:
            return .disappear.up
        case .down:
            return .disappear.down
        case .byLayer:
            return .disappear.byLayer
        case .wholeSymbol:
            return .disappear.wholeSymbol
        }
    }
}

enum ScaleEffect: String, CaseIterable, EffectProtocol {
    case value = "scale"
    case up
    case down
    case byLayer
    case wholeSymbol
    
    func value() -> ScaleSymbolEffect {
        switch self {
        case .value:
            return .scale
        case .up:
            return .scale.up
        case .down:
            return .scale.down
        case .byLayer:
            return .scale.byLayer
        case .wholeSymbol:
            return .scale.wholeSymbol
        }
    }
}

enum VariableColorEffect: String, CaseIterable, EffectProtocol {
    
    case value = "variableColor"

    case reversing
    
    case nonReversing
    
    case cumulative
    
    case iterative
    
    case hideInactiveLayers
    
    case dimInactiveLayers
    
    func value() -> VariableColorSymbolEffect {
        switch self {
        case .value:
            return .variableColor
        case .reversing:
            return .variableColor.reversing
        case .nonReversing:
            return .variableColor.nonReversing
        case .cumulative:
            return .variableColor.cumulative
        case .iterative:
            return .variableColor.iterative
        case .hideInactiveLayers:
            return .variableColor.hideInactiveLayers
        case .dimInactiveLayers:
            return .variableColor.dimInactiveLayers
        }
    }
}
