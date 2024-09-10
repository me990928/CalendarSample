//
//  CalendarView.swift
//  CalendarSample
//
//  Created by 広瀬友哉 on 2024/09/09.
//

import SwiftUI

/// カレンダーのメイン
struct CalendarView: View {
    
    @State var calendarModel: CalendarModel = .init()
    
    let currentDate: Date = Date()
    
    var body: some View {
        VStack{
            
            ZStack {
                HStack{
                    
                    Group{
                        // 先月、来月の選択
                        Button(action: {}, label: {
                            Image(systemName: "chevron.backward")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "chevron.forward")
                        })
                    }
                    
                    Spacer()
                    
                }.padding()
                
                
                HStack {
                    
                    Spacer()
                    
                    Text("2024年 ").bold()
                    Text("9月").bold()
                    
                    Spacer()
                    
                }
            }
            
            GeometryReader { geo in
                VStack {
                    HStack(spacing: 0,content: {
                        Grid(horizontalSpacing: 0) {
                            GridRow {
                                Text("日").frame(width: geo.size.width / 7).foregroundStyle(.red)
                                Text("月").frame(width: geo.size.width / 7)
                                Text("火").frame(width: geo.size.width / 7)
                                Text("水").frame(width: geo.size.width / 7)
                                Text("木").frame(width: geo.size.width / 7)
                                Text("金").frame(width: geo.size.width / 7)
                                Text("土").frame(width: geo.size.width / 7).foregroundStyle(.blue)
                            }
                        }
                    })
                    
                    CalendarDateView(calendarArr: $calendarModel.calendarArr).padding(.vertical)
                }
            }
        }.onAppear(){
            calendarModel.createCalendar(current: currentDate)
        }
    }
}

#Preview {
    CalendarView()
}
