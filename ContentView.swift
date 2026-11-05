import SwiftUI

struct ContentView: View {
    @State private var plantName = ""
    @State private var locationName = ""
    @State private var showCamera = false
    @State private var selectedTimeZone = ""
    @State private var reminderTime: DateComponents = DateComponents()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("🌿 Plant Reminder Assistant")
                .font(.largeTitle)
                .padding(.top)
            
            TextField("Enter plant name", text: $plantName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter location (city/area)", text: $locationName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("📸 Take a photo") {
                showCamera.toggle()
            }
            .padding()
            .buttonStyle(.bordered)
            .tint(.blue)
            
            Button("⏰ Set Reminder") {
                setReminder()
            }
            .padding()
            .buttonStyle(.bordered)
            .tint(.green)
            
            Text("Brought to you by GitLabsVPN")
                .foregroundColor(.secondary)
                .font(.caption)
                .padding(.bottom)
            
            Spacer()
        }
        .sheet(isPresented: $showCamera) {
            ImagePicker(image: $plantName)
        }
    }
    
    private func setReminder() {
        print("Plant Name: $plantName)")
        print("Location Name: $locationName)")
        print("Time Zone: $selectedTimeZone)")
        // Later: call CalendarManager to schedule event
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
