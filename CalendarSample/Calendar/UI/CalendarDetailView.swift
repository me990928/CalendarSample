//
//  CalendarDetailView.swift
//  CalendarSample
//
//  Created by 広瀬友哉 on 2024/09/09.
//

import SwiftUI

/// DateViewから遷移するページ
///  - .sheet等で遷移する
struct CalendarDetailView: View {
    @Binding var calendarDatail: [People]
    
    var body: some View {
        Text(calendarDatail.first?.date.description ?? Date().description)
        Text("¥\(sameWage())")
    }
    
    func sameWage()->Int{
        var wage: Int = 0
        for i in calendarDatail {
            wage += i.wage
        }
        return wage
    }
    
}

#Preview {
    CalendarView()
}
