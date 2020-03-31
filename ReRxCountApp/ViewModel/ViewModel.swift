//
//  ViewModel.swift
//  ReRxCountApp
//
//  Created by 南部竜太郎 on 2020/03/31.
//  Copyright © 2020 nmbry. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ReSwift

class ViewModel: StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    
    // MARK: Input Streams
    let countUpBtnTapped = PublishRelay<Void>()
    let countDownBtnTapped = PublishRelay<Void>()
    
    // MARK: Output Streams
    private var countLabelStream = PublishRelay<String>()
    var countLabel: Signal<String> {
        return self.countLabelStream.asSignal()
    }

    private var disposeBag: DisposeBag?
    
    init() {
        mainStore.subscribe(self)
        self.disposeBag = DisposeBag()
        self.bindInputFromViewControllerStream()
    }
    
    deinit {
        self.disposeBag = nil
    }
    
    func newState(state: AppState) {
        self.countLabelStream.accept("\(state.counter)")
    }

    private func bindInputFromViewControllerStream() {
        // MARK: カウントアップボタン押下時の処理
        self.countUpBtnTapped
            .subscribe(onNext: {
                mainStore.dispatch(CountActionUp())
            }).disposed(by: self.disposeBag!)
        
        // MARK: カウントダウンボタン押下時の処理
        self.countDownBtnTapped
            .subscribe(onNext: {
                mainStore.dispatch(CountActionDown())
            }).disposed(by: self.disposeBag!)
    }
}
