import Foundation

extension Date {
    
    func getMonthName() -> String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        let name  = names[month-1]
        
        return name
    }
    
    static func makeDate(day: Int, month: Int, year: Int) -> Date {
        let calendar = Calendar.current
        let components = DateComponents(year: year, month: month, day: day)
        let date = calendar.date(from: components)!
        
        return date
    }
    func firstWeekDayOfMonth() -> Int {
        let calendar = Calendar.current
        let firstDay = calendar.component(.weekday, from: self)
        
        return firstDay
    }
    func numberOfDaysInMonth() -> Int {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: self)!
        let numDays = range.count
        
        return numDays
    }
}
