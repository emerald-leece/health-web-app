//
//  FastTimer.swift
//  health-tracker-app
//
//  Created by Emerald Leece on 06/05/2025.
//

import Foundation
import Combine

class FastTimer: ObservableObject {
    private var startTime: Date?
    private var accumulatedTime:TimeInterval = 0
    private var timer: Cancellable?
  
    @Published var isRunning = false {
        didSet {
            if self.isRunning {
                self.start()
            } else {
                self.stop()
            }
        }
    }
    @Published private(set) var elapsedTime: TimeInterval = 0
    
    func start() -> Void {
        self.startTime = Date()
        self.timer?.cancel()
        self.timer = Timer.publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
        .sink { _ in self.elapsedTime = self.getElapsedTime()}
    }
    
    private func getElapsedTime() -> TimeInterval {
       return -(self.startTime?.timeIntervalSinceNow ??     0)+self.accumulatedTime
    }
    
    func stop() -> Void {
        self.timer?.cancel()
        self.timer = nil
        self.elapsedTime = 0
        self.startTime = nil
        self.isRunning = false
    }

}
