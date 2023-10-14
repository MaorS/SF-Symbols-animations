//
//  ViewController.swift
//  SF Symbols animations
//
//  Created by Maor on 14/10/2023.
//

import UIKit
import SFSafeSymbols
import RSSelectionMenu

class ViewController: UIViewController {
    
    @IBOutlet weak var colorWell: UIColorWell!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var effectLabel: UILabel!
    
    var presenter: Presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.onViewDidLoad()
        colorWell.addTarget(self, action: #selector(colorWellChanged(_:)), for: .valueChanged)
    }
    
    func updateUI(with viewModel: ViewModel) {
        imageView.image = UIImage(systemName: viewModel.symbol.rawValue)
        imageView.clipsToBounds = false
        imageView.tintColor = viewModel.color
        label.text = viewModel.symbol.rawValue
        updateUiWithEffects()
        collectionView.reloadData()
    }
    
    @objc func colorWellChanged(_ sender: Any) {
        presenter.onDidSelect(color: colorWell.selectedColor)
    }
    
    private func showMenu(on sourceView: UIView,
                          options: [String],
                          selectedOptions: [String],
                          handler: @escaping (String, Bool) -> Void) {
        
        let selectionMenu = RSSelectionMenu(selectionStyle: .multiple,
                                            dataSource: options) { (cell, name, indexPath) in
            cell.textLabel?.text = options[indexPath.row]
        }
        
        selectionMenu.setSelectedItems(items: selectedOptions) { (item, _, isSelected, _) in
            handler(item ?? "", isSelected)
        }
        
        selectionMenu.show(style: .popover(sourceView: sourceView, size: .zero, arrowDirection: .any, hideNavBar: false), from: self)
    }
    
    @IBAction func onPulseAction(_ sender: UIButton) {
        
        let options: [String] = PulseEffect.allCases.map { $0.rawValue }
        let selectedOptions = self.presenter.effectStore.pulseEffect.filter {
            $0.value == true
        }.map { $0.key.rawValue }
        
        showMenu(on: sender,
                 options: options,
                 selectedOptions: selectedOptions) { item, isSelected in
            guard let pulseEffect = PulseEffect(rawValue: item) else { return }
            self.presenter.effectStore.pulseEffect.updateValue(isSelected,
                                                               forKey: pulseEffect)
            
            self.updateUiWithEffects()
        }
    }
    
    
    @IBAction func onBounceAction(_ sender: UIButton) {
        let options: [String] = BounceEffect.allCases.map { $0.rawValue }
        let selectedOptions = self.presenter.effectStore.bounceEffect.filter {
            $0.value == true
        }.map { $0.key.rawValue }
        
        showMenu(on: sender,
                 options: options,
                 selectedOptions: selectedOptions) { item, isSelected in
            guard let effect = BounceEffect(rawValue: item) else { return }
            self.presenter.effectStore.bounceEffect.updateValue(isSelected,
                                                                forKey: effect)
            
            self.updateUiWithEffects()
        }
    }
    
    @IBAction func onAppearAction(_ sender: UIButton) {
        let options: [String] = AppearEffect.allCases.map { $0.rawValue }
        let selectedOptions = self.presenter.effectStore.appearEffect.filter {
            $0.value == true
        }.map { $0.key.rawValue }
        showMenu(on: sender,
                 options: options,
                 selectedOptions: selectedOptions) { item, isSelected in
            guard let effect = AppearEffect(rawValue: item) else { return }
            self.presenter.effectStore.appearEffect.updateValue(isSelected,
                                                                forKey: effect)
            self.updateUiWithEffects()
        }
    }
    
    @IBAction func onDisappearAction(_ sender: UIButton) {
        let options: [String] = DisappearEffect.allCases.map { $0.rawValue }
        let selectedOptions = self.presenter.effectStore.disappearEffect.filter {
            $0.value == true
        }.map { $0.key.rawValue }
        
        showMenu(on: sender,
                 options: options,
                 selectedOptions: selectedOptions) { item, isSelected in
            guard let effect = DisappearEffect(rawValue: item) else { return }
            self.presenter.effectStore.disappearEffect.updateValue(isSelected,
                                                                   forKey: effect)
            
            self.updateUiWithEffects()
        }
    }
    
    @IBAction func onScaleAction(_ sender: UIButton) {
        let options: [String] = ScaleEffect.allCases.map { $0.rawValue }
        let selectedOptions = self.presenter.effectStore.scaleEffect.filter {
            $0.value == true
        }.map { $0.key.rawValue }
        
        showMenu(on: sender,
                 options: options,
                 selectedOptions: selectedOptions) { item, isSelected in
            guard let effect = ScaleEffect(rawValue: item) else { return }
            self.presenter.effectStore.scaleEffect.updateValue(isSelected,
                                                               forKey: effect)
            self.updateUiWithEffects()
        }
    }
    
    
    @IBAction func onVariableColorAction(_ sender: UIButton) {
        let options: [String] = VariableColorEffect.allCases.map { $0.rawValue }
        let selectedOptions = self.presenter.effectStore.variableColorEffect.filter {
            $0.value == true
        }.map { $0.key.rawValue }
        
        showMenu(on: sender,
                 options: options,
                 selectedOptions: selectedOptions) { item, isSelected in
            guard let effect = VariableColorEffect(rawValue: item) else { return }
            self.presenter.effectStore.variableColorEffect.updateValue(isSelected,
                                                                       forKey: effect)
            self.updateUiWithEffects()
        }
    }
    
    private func updateUiWithEffects() {
        self.imageView.removeAllSymbolEffects()
        
        self.presenter.effectStore.variableColorEffect.forEach {
            if $0.value == true {
                self.imageView.addSymbolEffect($0.key.value(),
                                               options: .repeating)
            }
        }
        self.presenter.effectStore.pulseEffect.forEach {
            if $0.value == true {
                self.imageView.addSymbolEffect($0.key.value(),
                                               options: .repeating)
            }
        }
        self.presenter.effectStore.bounceEffect.forEach {
            if $0.value == true {
                self.imageView.addSymbolEffect($0.key.value(),
                                               options: .repeating)
            }
        }
        
        //
        
        self.presenter.effectStore.scaleEffect.forEach {
            if $0.value == true {
                self.imageView.addSymbolEffect($0.key.value(),
                                               options: .repeating)
            }
            
        }
        
        self.presenter.effectStore.disappearEffect.forEach {
            if $0.value == true {
                self.imageView.addSymbolEffect($0.key.value(),
                                               options: .repeating)
            }
        }
        
        self.presenter.effectStore.appearEffect.forEach {
            if $0.value == true {
                self.imageView.addSymbolEffect($0.key.value(),
                                               options: .repeating)
            }
        }
    }
    
    
    
    
}

extension ViewController: UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SymbolCollectionViewCell", for: indexPath) as? SymbolCollectionViewCell else {
            fatalError()
        }
        
        let viewModel = presenter.viewModel(for: indexPath)
        
        cell.imageView.image = UIImage(systemSymbol: viewModel.symbol)
        cell.imageView.tintColor = viewModel.color
        cell.label.text = viewModel.symbol.rawValue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        presenter.onDidSelectItem(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width)/5
        return CGSize(width: width, height: width)
    }
    
}
