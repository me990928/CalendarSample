//
//  CalendarDateView.swift
//  CalendarSample
//
//  Created by 広瀬友哉 on 2024/09/09.
//

import SwiftUI

/// カレンダーの日付UI
///  - 繰り返し表示でカレンダーを描写
///  - 簡易的なテキストを表示
struct CalendarDateView: View {
    
    var count: Int = 1
    let lastDate: Int = 30
    @State var dateViewWidth: CGFloat = 0
    @Binding var currentDate: Date
    @Binding var calendarArr: [DateComponent]
    
    var body: some View {
        GeometryReader { geo in
            Grid(horizontalSpacing: 0) {
                let rowCount = calendarArr.count / 7
                ForEach(0..<rowCount, id: \.self) { week in
                    GridRow {
                        let startIndex = week * 7
                        let endIndex = startIndex + 7
                        ForEach(startIndex..<endIndex, id: \.self) { date in
                            if date < calendarArr.count {
                                DateView(width: dateViewWidth, currentDate: $currentDate, date: $calendarArr[date])
                            }
                        }
                    }
                    if rowCount != (week + 1) {
                        Divider()
                    }
                }
            }.onAppear(){
                dateViewWidth = geo.size.width / 7
            }
        }
    }
}

struct DateView: View {
    
    let width: CGFloat
    @State var current: Bool = false
    @Binding var currentDate: Date
    @Binding var date: DateComponent
    
    var body: some View {
        
        VStack{
            ZStack {
                if current {
                    Circle().foregroundStyle(.pink).frame(width: 40)
                }
                if date.month == DateTranslate(date: currentDate).getDateComponents().month?.description ?? "0" {
                    Text(date.day).frame(width: width).foregroundStyle(current ? .white : Color(.label)).bold(current)
                } else {
                    Text(date.day).frame(width: width).foregroundStyle(.gray)
                }
            }
            // 簡易的に書き込めるスペース
            // Text("$100000").font(.caption)
        }.onAppear(){
            checkCurrentDate()
        }.onChange(of: currentDate) {
            checkCurrentDate()
        }
    }
    
    func checkCurrentDate(){
        let comp = DateTranslate(date: Date()).getDateComponents()
        
        // 個別にフラグを判定
        let isSameYear = comp.year == Int(date.year)
        let isSameMonth = comp.month == Int(date.month)
        let isSameDay = comp.day == Int(date.day)
        // すべての条件が満たされているか確認
        self.current = isSameYear && isSameMonth && isSameDay
    }
}
