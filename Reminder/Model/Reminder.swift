import Foundation

struct Reminder: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    var name: String
    var completed: Bool
    
    static func new() -> Reminder {
        return Reminder(name: "", completed: false)
    }
}
