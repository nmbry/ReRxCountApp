//
//  CountMiddleware.swift
//  ReRxCountApp
//
//  Created by 南部竜太郎 on 2020/04/01.
//  Copyright © 2020 nmbry. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

struct CountMiddleware {
    func printLog() -> Middleware<AppState> {
        return { dispatch, getState in
            return { next in
                return { action in
                    switch action {
                    case is CountActionUp:
                        next(action)
                        print("CountAppUp Middleware")
                    case is CountActionDown:
                        next(action)
                        print("CountAppDown Middleware")
                    default:
                        next(action)
                    }
                }
            }
        }
    }
}
