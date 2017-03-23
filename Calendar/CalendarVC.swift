import UIKit

class CalendarVC: UIViewController {

    let calendar    = Calendar.current
    let formatter   = DateFormatter()
    var currentDate = Date()
    var startDate   = Date()
    var listDays    = [String]()
    var dayButtons  = [UIButton]()

    let todayCircle = UIImage(named: "today")
    let eventCircle = UIImage(named: "event")
    
    @IBOutlet weak var labelYearMonth: UIButton!
    
    @IBOutlet weak var day00: UIButton!
    @IBOutlet weak var day01: UIButton!
    @IBOutlet weak var day02: UIButton!
    @IBOutlet weak var day03: UIButton!
    @IBOutlet weak var day04: UIButton!
    @IBOutlet weak var day05: UIButton!
    @IBOutlet weak var day06: UIButton!
    @IBOutlet weak var day07: UIButton!
    @IBOutlet weak var day08: UIButton!
    @IBOutlet weak var day09: UIButton!
    @IBOutlet weak var day10: UIButton!
    @IBOutlet weak var day11: UIButton!
    @IBOutlet weak var day12: UIButton!
    @IBOutlet weak var day13: UIButton!
    @IBOutlet weak var day14: UIButton!
    @IBOutlet weak var day15: UIButton!
    @IBOutlet weak var day16: UIButton!
    @IBOutlet weak var day17: UIButton!
    @IBOutlet weak var day18: UIButton!
    @IBOutlet weak var day19: UIButton!
    @IBOutlet weak var day20: UIButton!
    @IBOutlet weak var day21: UIButton!
    @IBOutlet weak var day22: UIButton!
    @IBOutlet weak var day23: UIButton!
    @IBOutlet weak var day24: UIButton!
    @IBOutlet weak var day25: UIButton!
    @IBOutlet weak var day26: UIButton!
    @IBOutlet weak var day27: UIButton!
    @IBOutlet weak var day28: UIButton!
    @IBOutlet weak var day29: UIButton!
    @IBOutlet weak var day30: UIButton!
    @IBOutlet weak var day31: UIButton!
    @IBOutlet weak var day32: UIButton!
    @IBOutlet weak var day33: UIButton!
    @IBOutlet weak var day34: UIButton!
    @IBOutlet weak var day35: UIButton!
    @IBOutlet weak var day36: UIButton!
    @IBOutlet weak var day37: UIButton!
    @IBOutlet weak var day38: UIButton!
    @IBOutlet weak var day39: UIButton!
    @IBOutlet weak var day40: UIButton!
    @IBOutlet weak var day41: UIButton!
    
    @IBAction func onPrevMonth(_ sender: Any) {
        currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate)!
        updateCalendar()
    }
    
    @IBAction func onNextMonth(_ sender: AnyObject) {
        currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate)!
        updateCalendar()
    }
    
    @IBAction func onToday(_ sender: AnyObject) {
        currentDate = Date()
        updateCalendar()

    }
    
    func onDayClick(_ sender: AnyObject) {
        let dayIndex       = sender.tag ?? 0
        let selectedDay    = calendar.date(byAdding: .day, value: dayIndex, to: startDate)!
        let strSelectedDay = formatter.string(from: selectedDay)
        
        //Go to AddEventVC
        performSegue(withIdentifier: "AddEvent", sender: strSelectedDay)
        print(strSelectedDay)
        
        //Set selected date to have a blue background circle
        dayButtons[dayIndex].setBackgroundImage(eventCircle, for: .normal)
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "MMMM d, yyyy"
        
        loadDayButtons()
        updateCalendar()
    }

    func loadDayButtons() {
        dayButtons.append(day00)
        dayButtons.append(day01)
        dayButtons.append(day02)
        dayButtons.append(day03)
        dayButtons.append(day04)
        dayButtons.append(day05)
        dayButtons.append(day06)
        dayButtons.append(day07)
        dayButtons.append(day08)
        dayButtons.append(day09)
        dayButtons.append(day10)
        dayButtons.append(day11)
        dayButtons.append(day12)
        dayButtons.append(day13)
        dayButtons.append(day14)
        dayButtons.append(day15)
        dayButtons.append(day16)
        dayButtons.append(day17)
        dayButtons.append(day18)
        dayButtons.append(day19)
        dayButtons.append(day20)
        dayButtons.append(day21)
        dayButtons.append(day22)
        dayButtons.append(day23)
        dayButtons.append(day24)
        dayButtons.append(day25)
        dayButtons.append(day26)
        dayButtons.append(day27)
        dayButtons.append(day28)
        dayButtons.append(day29)
        dayButtons.append(day30)
        dayButtons.append(day31)
        dayButtons.append(day32)
        dayButtons.append(day33)
        dayButtons.append(day34)
        dayButtons.append(day35)
        dayButtons.append(day36)
        dayButtons.append(day37)
        dayButtons.append(day38)
        dayButtons.append(day39)
        dayButtons.append(day40)
        dayButtons.append(day41)
        
        for (index, button) in dayButtons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(onDayClick(_:)), for: .touchUpInside)
        }
        
    }
        
    func updateCalendar() {
            updateDays()
            updateMonth()
        }
        
    func updateMonth() {
        let year = calendar.component(.year, from: currentDate)
        let month = currentDate.getMonthName()
        labelYearMonth.setTitle("\(month) \(year)", for: .normal)
    }
    
    func updateDays() {
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let firstDay = Date.makeDate(day: 1, month: month, year: year)
        let numDays = firstDay.numberOfDaysInMonth()
        let weekDay = firstDay.firstWeekDayOfMonth() - 1
        print("\(year)-\(month)")
        
        for _ in 0..<42 { listDays.append("") }
        
        for index in 0..<numDays {
            let day = weekDay + index
            listDays[day] = String(index)
        }
        
        var iniDay = calendar.date(byAdding: .day, value: -weekDay, to: firstDay)!
        startDate = iniDay
        
        for index in 0..<42 {
            let dayNumber = calendar.component(.day, from: iniDay)
            dayButtons[index].setTitle(String(dayNumber), for: .normal)

            let dayMonth = calendar.component(.month, from: iniDay)
            if dayMonth == month {
                dayButtons[index].backgroundColor = UIColor(white: 0, alpha: 0)
                dayButtons[index].setTitleColor(UIColor.white, for: .normal)
            } else {
                //Days outside of month
                dayButtons[index].backgroundColor = UIColor(white: 0, alpha: 0)
                dayButtons[index].setTitleColor(UIColor.init(white: 0, alpha: 0), for: .normal)
                dayButtons[index].isUserInteractionEnabled = false
            }	
            iniDay = calendar.date(byAdding: .day, value: 1, to: iniDay)!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Send selected day to CalendarAddEventVC
        let dest = segue.destination as? CalendarAddEventVC
        let dateSender = sender as? String
            dest?.selectedDay = dateSender
        //
        
    }
}



