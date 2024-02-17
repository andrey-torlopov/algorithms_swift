import Foundation

public class DateFormatter {

    fileprivate typealias Format = String
    
    private init() {}
    
    public enum DateFormat {
        /// yyyy-MM-dd'T'HH:mm:ss.SZ
        case full
        /// dd.MM.YY
        case short
        /// HH:mm
        case time
        /// yyyy-MM-dd
        case shortWithFullYear
        
        case custom(String)

        fileprivate static var defaultFormats: [DateFormat] { [.full, .shortWithFullYear] }
        
        fileprivate var dateFormat: Format {
            switch self {
            case .full:
                return "yyyy-MM-dd'T'HH:mm:ss.SZ"
            case .short:
                return "dd.MM.YY"
            case .time:
                return "HH:mm"
            case .shortWithFullYear:
                return "yyyy-MM-dd"
            case .custom(let format):
                return format

            }
        }
    }
    
    private static var cachedFormatters: [Format: Foundation.DateFormatter] = [:]
    
    public static func tryToDecodeDate(_ decoder: Decoder) throws -> Date {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        var date: Date?
        
        for format in DateFormat.defaultFormats {
            if let decodedDate = dateFormatter(for: format).date(from: string) {
                date = decodedDate
                break
            }
        }
        
        if let date {
            return date
        } else {
            throw DecodingError.valueNotFound(Date.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "\(decoder)"))
        }
    }
    
    public static func stringFromDate(_ date: Date, withFormat format: DateFormat) -> String {
        let formatter = dateFormatter(for: format)
        return formatter.string(from: date)
    }

    public static func dateFromString(_ string: String, withFormat format: DateFormat) -> Date? {
        return dateFormatter(for: format).date(from: string)
    }

    private static func dateFormatter(for format: DateFormat) -> Foundation.DateFormatter {
        if let cachedFormatter = cachedFormatters[format.dateFormat] {
            return cachedFormatter
        }
        
        let dateFormatter = Foundation.DateFormatter()
        dateFormatter.dateFormat = format.dateFormat
        // Добавить чтение локали
        // FIXME: Тут иногда crash прилетает. Пока не разобрался почему.
        dateFormatter.locale = Locale(identifier: "ru_RU")
        cachedFormatters[format.dateFormat] = dateFormatter
        
        return dateFormatter
    }
}
 
public extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
