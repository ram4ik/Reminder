import SwiftUI

struct ReminderCell: View {
    @ObservedObject private var _reminderVM: ReminderCellViewModel
    
    init(vm: ReminderCellViewModel) {
        self._reminderVM = vm
    }
    
    var body: some View {
        HStack {
            Image(systemName: _reminderVM.reminder.completed
                    ? "checkmark.circle.fill"
                    : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(_reminderVM.reminder.completed
                                    ? .orange
                                    : Color(UIColor.lightGray))
                .onTapGesture {
                    _reminderVM.reminder.completed.toggle()
                    _reminderVM.setReminder()
                }
            
            TextField("Enter new reminder",
                      text: $_reminderVM.reminder.name,
                      onEditingChanged: { _ in },
                      onCommit: {
                        let reminder = _reminderVM.reminder
                        
                        if reminder.name.isEmpty {
                            _reminderVM.deleteReminder()
                        }
                        else {
                            _reminderVM.setReminder()
                        }
                      })
        }
    }
}
