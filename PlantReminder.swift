import Foundation
import CoreData

@objc(PlantReminder)
public class PlantReminder: NSManagedObject {
    @NSManaged public var plantName: String
    @NSManaged public var locationName: String
    @NSManaged public var reminderTime: DateComponents
}
