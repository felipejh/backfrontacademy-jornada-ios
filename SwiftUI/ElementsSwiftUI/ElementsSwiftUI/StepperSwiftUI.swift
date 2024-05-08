//
//  Stepper.swift
//  ElementsSwiftUI
//
//  Created by Felipe Hoffmann on 08/05/24.
//

import SwiftUI

struct StepperSwiftUI: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
            Stepper("Contador", value: $counter, in: 0...10, step: 2)
                .labelsHidden()
                .padding()
            
            Text("Valor stepper: \(counter)")
        }
    }
}

#Preview {
    StepperSwiftUI()
}
