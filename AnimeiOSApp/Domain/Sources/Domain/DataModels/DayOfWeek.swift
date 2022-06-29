import Foundation

public enum DayOfWeek: Int {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

extension DayOfWeek {
    public var label: String {
        switch self {
        case .sunday:
            return "日"
        case .monday:
            return "月"
        case .tuesday:
            return "火"
        case .wednesday:
            return "水"
        case .thursday:
            return "木"
        case .friday:
            return "金"
        case .saturday:
            return "土"
        }
    }
}
