//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Sergio Ordaz Romero on 14/08/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    @StateObject var scrumTimer: ScrumTimer = ScrumTimer()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
                    .environmentObject(scrumTimer)
            }
        }
    }
}
