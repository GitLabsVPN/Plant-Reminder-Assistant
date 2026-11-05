import EventKit

class CalendarManager {
    let eventStore = EKEventStore()
    
    func requestCalendarAccess() {
        eventStore.requestAccess(to: .event) { (granted, error) in
            if let error = error {
                print("Calendar access denied: $error.localizedDescription)")
                return
            }
            if granted {
                self.schedulePlantReminder()
            } else {
                print("No access to calendar")
            }
        }
    }
    
    func schedulePlantReminder() {
        let event = EKEvent(eventStore: eventStore)
        event.title = "Water Your Plant"
        event.startDate = Date().addingTimeInterval(60 * 60) // Example: 1 hour from now
        event.endDate = event.startDate
        event.location = locationName
        event.notes = "Reminder for plant: $plantName)"
        event.allDay = false
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        do {
            try eventStore.save(event, span: .thisEvent)
            print("Reminder scheduled for plant: $plantName) at $event.startDate)")
        } catch {
            print("Failed to save event: $error.localizedDescription)")
        }
    }
}
