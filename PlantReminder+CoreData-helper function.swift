import Foundation
import CoreData

func savePlantReminder(plantName: String, locationName: String, reminderTime: DateComponents) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext

    let reminder = PlantReminder(context: context)
    reminder.plantName = plantName
    reminder.locationName = locationName
    reminder.reminderTime = reminderTime

    do {
        try context.save()
    } catch {
        print("Failed to save plant reminder: $error.localizedDescription)")
    }
}
