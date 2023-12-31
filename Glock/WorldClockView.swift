//
//  WorldClockView.swift
//  Glock
//
//  Created by Fabio Attianese on 21/11/23.
//

import SwiftUI

struct WorldClockView: View {
    var body: some View {
        TabView{
            Text("Hello, This Screen is Empty!")
            
                .tabItem {
                    Label ("World Clock", systemImage: "globe")
                }
            
            ContentView()
                .tabItem {
                    Label("Alarms", systemImage: "alarm.fill")
                }
            TimerView()
                .tabItem {
                    Label ("Stopwatch", systemImage: "stopwatch.fill")
                }
            TimerView()
                .tabItem {
                    Label ("Timers", systemImage: "timer")
                }
        }
    }
}

#Preview {
    WorldClockView()
}
