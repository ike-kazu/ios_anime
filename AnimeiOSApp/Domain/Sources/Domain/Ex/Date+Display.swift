import Foundation

private let dateFormatter = DateFormatter()

extension Date {
    public var display: String {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}
