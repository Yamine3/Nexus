//
//  TabView.swift
//  Memora
//
//  Created by Apprenant76 on 29/07/2026.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var scheduleVM = MyScheduleViewModel()
    
    var body: some View {
        TabView {
            Tab("Workshops", systemImage: "sparkles") {
                WorkshopsView(
                    
                )
            }
            Tab("My Schedule", systemImage: "ticket") {
                MyScheduleView()
            }
        }
        .tint(.accentPurple)
        .environment(scheduleVM)
    }
}

#Preview {
    TabBarView()
}
