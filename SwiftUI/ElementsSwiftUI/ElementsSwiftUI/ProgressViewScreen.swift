//
//  ProgressViewScreen.swift
//  ElementsSwiftUI
//
//  Created by Felipe Hoffmann on 08/05/24.
//

import SwiftUI

struct ProgressViewScreen: View {
    
    @State private var progress: Double = 0
    private var maxValue = 10.0
    
    var body: some View {
        VStack(spacing: 10.0) {
            Button("Avançar") {
                progress += 0.5
            }
            
            ProgressView("Carregamento...", value: progress, total: maxValue)
                .labelsHidden()
                .padding()
            
            Button("Diminuir") {
//                progress -= 0.5
                startProgress()
            }
        }
        .padding()
    }
    
    func startProgress() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.progress < maxValue {
                progress += 2
            } else {
                timer.invalidate()
                progress = 0
            }
        }
    }
}

#Preview {
    ProgressViewScreen()
}
