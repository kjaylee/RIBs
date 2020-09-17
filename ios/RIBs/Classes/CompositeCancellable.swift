//
//  CompositeCancellable.swift
//  RIBs
//
//  Created by Jay Lee on 2020/09/17.
//  Copyright © 2020 Uber Technologies. All rights reserved.
//
import Combine

final class CompositeCancellable: Cancellable {
    private var isCanceled: Bool = false
    private var cancellables: [Cancellable] = []
    
    func add(cancelable: Cancellable) {
        guard !isCanceled else {
            cancelable.cancel()
            return
        }
        cancellables.append(cancelable)
    }
    
    func cancel() {
        guard !isCanceled else {
            return
        }
        isCanceled = true
        cancellables.forEach { $0.cancel() }
    }
}
