//
//  DatePickerScreen.swift
//  ElementsSwiftUI
//
//  Created by Felipe Hoffmann on 07/05/24.
//

import SwiftUI

struct DatePickerScreen: View {
    
    @State var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 30.0) {
            DatePicker("Escolha uma data", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
            Text("A data é: \(formattedDate).")
                .padding()
            
            DatePicker("Escolha uma data", selection: $selectedDate, displayedComponents: .date).labelsHidden().datePickerStyle(.wheel)
        }
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: selectedDate)
    }
}

#Preview {
    DatePickerScreen()
}
