//
//  CountReducer.swift
//  ReRxCountApp
//
//  Created by 南部竜太郎 on 2020/03/31.
//  Copyright © 2020 nmbry. All rights reserved.
//

import ReSwift

func countReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case is CountActionUp:
        state.counter += 1
    case is CountActionDown:
        state.counter -= 1
    case is CountActionReset:
        state.counter = 0
    default:
        break
    }
    
    return state
}
