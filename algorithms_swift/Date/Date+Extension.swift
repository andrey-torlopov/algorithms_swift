import Foundation

public extension Date {

    /// Day count from self to end Date
    func daysCount(to endDate: Date) -> Int {
        guard let value = Calendar.current.dateComponents([.day], from: self, to: endDate).day else { return 0 }
        return value + 1
    }

    /// Date convert to day.month
    /// 01.02.2020 -> 01.02
    func toDayMonthString() -> String {
        return DateFormatter.stringFromDate(self, withFormat: .custom("dd.MM"))
    }

    /// Create date from string with format
    init(_ string: String, format: DateFormatter.DateFormat) {
        self = DateFormatter.dateFromString(string, withFormat: format) ?? Date()
    }
}
