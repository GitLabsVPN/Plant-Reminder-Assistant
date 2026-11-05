import SwiftUI

struct MainView: View {
    @State private var plantName = ""
    @State private var locationName = ""
    @State private var showCamera = false
    @State private var reminderTime: DateComponents = DateComponents()
    @State private var selectedTimeZone: String = ""

    var body: some View {
        VStack {
            Text("Plant Reminder Assistant")
                .font(.largeTitle)
                .padding(.top)

            TextField("Enter plant name", text: $plantName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Enter location (city/area)", text: $locationName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Take a photo") {
                showCamera.toggle()
            }
            .padding()
            .buttonStyle(.bordered)
            .tint(.blue)

            Button("Set Reminder") {
                // Call the calendar manager here
                setReminder()
            }
            .padding()
            .buttonStyle(.bordered)
            .tint(.green)

            Text("Brought to you by GitLabsVPN")
                .foregroundColor(.gray)
                .font(.caption)
                .padding(.bottom)

            Spacer()
        }
        .sheet(isPresented: $showCamera) {
            ImagePicker()
        }
    }

    func setReminder() {
        print("Plant Name: $plantName)")
        print("Location Name: $locationName)")
        print("Selected Time: $reminderTime)")
        print("Time Zone: $selectedTimeZone)")
        // You can later integrate with CalendarManager here
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
