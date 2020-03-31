//
//  ViewController.swift
//  ReRxCountApp
//
//  Created by 南部竜太郎 on 2020/03/31.
//  Copyright © 2020 nmbry. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    // MARK: UI部品
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpBtn: UIButton!
    @IBOutlet weak var countDownBtn: UIButton!
    
    private let viewModel = ViewModel()
    private var disposeBag: DisposeBag?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.disposeBag = DisposeBag()
        self.bindInputFromViewStream()
        self.bindOutputToViewStream()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.disposeBag = nil
    }
    
    private func bindInputFromViewStream() {
        // MARK: カウントアップボタン
        self.countUpBtn.rx.tap.asSignal()
            .emit(to: viewModel.countUpBtnTapped)
            .disposed(by: self.disposeBag!)
        
        // MARK: カウントダウンボタン
        self.countDownBtn.rx.tap.asSignal()
            .emit(to: viewModel.countDownBtnTapped)
            .disposed(by: self.disposeBag!)
    }
    
    private func bindOutputToViewStream() {
        // MARK: カウントラベル
        self.viewModel.countLabel
            .emit(to: self.countLabel.rx.text)
            .disposed(by: self.disposeBag!)
    }

}

