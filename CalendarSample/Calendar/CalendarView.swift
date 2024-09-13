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
    
    @State var currentDate: Date = Date()
    @State var year: String = ""
    @State var month: String = ""
    
    let dateFormatter = DateFormatter()
    
    // testケース
    var peoples: [People]
    @State var filterdPeoples: [People] = []
    
    init(){
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        self.peoples = [
            People(wage: 1000, date: dateFormatter.date(from: "2023/11/25") ?? Date()),
            People(wage: 2000, date: dateFormatter.date(from: "2023/11/30") ?? Date()),
            People(wage: 3000, date: dateFormatter.date(from: "2023/12/26") ?? Date()),
            People(wage: 4000, date: dateFormatter.date(from: "2023/12/27") ?? Date()),
            People(wage: 5000, date: dateFormatter.date(from: "2023/12/30")  ?? Date()),
            People(wage: 6000, date: dateFormatter.date(from: "2024/01/25") ?? Date()),
            People(wage: 7000, date: dateFormatter.date(from: "2024/01/30")  ?? Date()),
            People(wage: 8000, date: dateFormatter.date(from: "2024/09/26")  ?? Date()),
            People(wage: 9000, date: dateFormatter.date(from: "2024/02/27") ?? Date()),
            People(wage: 10000, date: dateFormatter.date(from: "2024/02/1") ?? Date()),
            People(wage: 10000, date: dateFormatter.date(from: "2024/02/1") ?? Date())
        ]
        
    }
    
    var body: some View {
        VStack{
            
            ZStack {
                HStack{
                    
                    Group{
                        // 先月、来月の選択
                        Button(action: {
                            currentDate = calendarModel.downCalendarMonth(current: currentDate)
                            calendarModel.calendarArr = []
                            calendarModel.createCalendar(current: currentDate)
                        }, label: {
                            Image(systemName: "chevron.backward")
                        })
                        Button(action: {
                            currentDate = calendarModel.upCalendarMonth(current: currentDate)
                            calendarModel.calendarArr = []
                            calendarModel.createCalendar(current: currentDate)
                        }, label: {
                            Image(systemName: "chevron.forward")
                        })
                    }
                    
                    Spacer()
                    
                }.padding()
                
                
                HStack {
                    
                    Spacer()
                    
                    Text("\(year)年 ").bold()
                    Text("\(month)月").bold()
                    
                    Spacer()
                    
                }.onAppear(){
                    updateCurrentDate()
                    filterdPeoples = filterPeople(byYear: Int(year) ?? 0, month: Int(month) ?? 0, peoples: peoples)
                }.onChange(of: currentDate) {
                    updateCurrentDate()
                    filterdPeoples = filterPeople(byYear: Int(year) ?? 0, month: Int(month) ?? 0, peoples: peoples)
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
                    
                    CalendarDateView(currentDate: $currentDate, calendarArr: $calendarModel.calendarArr, calendarDetailData: $filterdPeoples).padding(.vertical)
                }
            }
        }.onAppear(){
            calendarModel.createCalendar(current: currentDate)
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height < -50 {
                        // 上スワイプ
                        print("上")
                        withAnimation(){
                            currentDate = calendarModel.upCalendarMonth(current: currentDate)
                            calendarModel.calendarArr = []
                            calendarModel.createCalendar(current: currentDate)
                        }
                    } else if value.translation.height > 30 {
                        // 下スワイプ
                        print("下")
                        withAnimation(){
                            currentDate = calendarModel.downCalendarMonth(current: currentDate)
                            calendarModel.calendarArr = []
                            calendarModel.createCalendar(current: currentDate)
                        }
                    }
                }
        )
    }
    
    /// 年月のテキストを変更
    func updateCurrentDate(){
        year = DateTranslate(date: currentDate).getStructDateComponent().year
        month = DateTranslate(date: currentDate).getStructDateComponent().month
    }
    
    func filterPeople(byYear year: Int, month: Int, peoples: [People]) -> [People] {
        let calendar = Calendar.current
        return peoples.filter { people in
            let components = calendar.dateComponents([.year, .month], from: people.date)
            return components.year == year && components.month == month
        }
    }
    
}

#Preview {
    CalendarView()
}


struct People {
    let wage: Int
    let date: Date
}
