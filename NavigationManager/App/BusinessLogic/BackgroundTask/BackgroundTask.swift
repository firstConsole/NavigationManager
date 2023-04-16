//
//  BackgroundTask.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 07.04.2023.
//

import UIKit

extension MapViewController {
    func runBackgroundTask() {
        backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
            guard let self = self,
                  let task = self.backgroundTask else {
                return
            }
            
            UIApplication.shared.endBackgroundTask(task)
            self.backgroundTask = UIBackgroundTaskIdentifier.invalid
        }
    }
}
