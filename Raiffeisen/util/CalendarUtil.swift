import SwiftUI

struct CalendarUtil {
        
    private static let currentMonthInt = Calendar.current.component(.month, from: Date())
    private static let currentDayInt = Calendar.current.component(.day, from: Date())
    static let currentDayOfWeek = Calendar.current.component(.weekday, from: Date())
    
    private static let monthes = [
        1 : "январь",
        2 : "февраль",
        3 : "март",
        4 : "апрель",
        5 : "май",
        6 : "июнь",
        7 : "июль",
        8 : "август",
        9 : "сентябрь",
        10 : "октябрь",
        11 : "ноябрь",
        12 : "декабрь"
    ]
    
    private static let monthesGenitive = [
        1 : "января",
        2 : "февраля",
        3 : "марта",
        4 : "апреля",
        5 : "мая",
        6 : "июня",
        7 : "июля",
        8 : "августа",
        9 : "сентября",
        10 : "октября",
        11 : "ноября",
        12 : "декабря"
    ]
    
    private static let daysOfWeek = [
        -1: "суббота",
        0 : "воскресенье",
        1 : "понедельник",
        2 : "вторник",
        3 : "среда",
        4 : "четверг",
        5 : "пятница",
        6 : "суббота",
        7 : "воскресенье"
    ]
    
    static let previousDayOfWeek: String = {
        daysOfWeek[currentDayOfWeek - 2]!
    }()
    
    static let currentMonth: String = {
       monthes[currentMonthInt]!
    }()
    
    static let currentMonthGenitive: String = {
        monthesGenitive[currentMonthInt]!
    }()
    
    static let previousDayInt: Int = {
        currentDayInt == 1 ? 1 : currentDayInt - 1
    }()
}
