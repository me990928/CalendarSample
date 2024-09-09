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
    
    var body: some View {
        GeometryReader { geo in
            Grid(horizontalSpacing: 0){
                GridRow {
                    VStack{
                        Text("1").frame(width: geo.size.width / 7)
                        // 簡易的に書き込めるスペース
                    }
                    Text("2").frame(width: geo.size.width / 7)
                    Text("3").frame(width: geo.size.width / 7)
                    Text("4").frame(width: geo.size.width / 7)
                    Text("5").frame(width: geo.size.width / 7)
                    Text("6").frame(width: geo.size.width / 7)
                    Text("7").frame(width: geo.size.width / 7)
                }
                Divider()
                GridRow {
                    Text("8").frame(width: geo.size.width / 7)
                    Text("9").frame(width: geo.size.width / 7)
                    Text("10").frame(width: geo.size.width / 7)
                    Text("11").frame(width: geo.size.width / 7)
                    Text("12").frame(width: geo.size.width / 7)
                    Text("13").frame(width: geo.size.width / 7)
                    Text("14").frame(width: geo.size.width / 7)
                }
                Divider()
                GridRow{
                    Text("15").frame(width: geo.size.width / 7)
                    Text("16").frame(width: geo.size.width / 7)
                    Text("17").frame(width: geo.size.width / 7)
                    Text("18").frame(width: geo.size.width / 7)
                    Text("19").frame(width: geo.size.width / 7)
                    Text("20").frame(width: geo.size.width / 7)
                    Text("21").frame(width: geo.size.width / 7)
                }
                Divider()
                GridRow{
                    Text("22").frame(width: geo.size.width / 7)
                    Text("23").frame(width: geo.size.width / 7)
                    Text("24").frame(width: geo.size.width / 7)
                    Text("25").frame(width: geo.size.width / 7)
                    Text("26").frame(width: geo.size.width / 7)
                    Text("27").frame(width: geo.size.width / 7)
                    Text("28").frame(width: geo.size.width / 7)
                }
                Divider()
                GridRow{
                    Text("29").frame(width: geo.size.width / 7)
                    Text("30").frame(width: geo.size.width / 7)
                }
            }
        }
    }
}

#Preview {
    CalendarDateView()
}
