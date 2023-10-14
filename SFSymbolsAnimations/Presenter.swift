//
//  Presenter.swift
//  SF Symbols animations
//
//  Created by Maor on 14/10/2023.
//

import Foundation
import SFSafeSymbols

class Presenter {
    
    lazy var allSymbols: [SFSymbol] = {
        Array(SFSymbol.allSymbols.sorted(by: { $0.rawValue < $1.rawValue }))
    }()
    
    weak var view: ViewController!
    var selectedItem: SFSymbol?
    var effectStore: EffectStore = EffectStore()
    var selectedColor: UIColor?
    
    func onViewDidLoad() {
        
    }
    
    func numberOfItems(in section: Int) -> Int {
        allSymbols.count
    }
    
    func viewModel(for indexPath: IndexPath) -> ViewModel {
        let symbol = allSymbols[indexPath.item]
        return ViewModel(symbol: symbol, color: selectedColor)
    }
    
    func onDidSelectItem(at indexPath: IndexPath) {
        let selectedItem = allSymbols[indexPath.item]
        self.selectedItem = selectedItem
        view.updateUI(with: ViewModel(symbol: selectedItem, color: selectedColor))
    }
    
    func onDidSelect(color: UIColor?) {
        selectedColor = color
        guard let selectedItem else { return }
        view.updateUI(with: ViewModel(symbol: selectedItem, color: selectedColor))
    }
}
