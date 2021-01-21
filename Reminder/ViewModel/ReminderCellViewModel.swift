import SwiftUI

class ReminderCellViewModel: ObservableObject {
    @Published var reminder: Reminder
    
    init(reminder: Reminder) {
        self.reminder = reminder
    }
    
    func setReminder() {
        ReminderManager.shared.set(reminder)
    }
    
    func deleteReminder() {
        ReminderManager.shared.delete(reminder)
    }
}
