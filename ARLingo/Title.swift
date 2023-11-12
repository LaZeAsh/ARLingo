import SwiftUI

struct ARLingoView: View {
    // Define the colors to complement the indigo background
    let buttonColor = Color.white.opacity(0.9)
    let iconColor = Color.indigo
    let textColor = Color.white

    var body: some View {
        @ObservedObject var userChoice = UserChoice(language: "francais")
        NavigationView {
            ZStack {
                // Use the indigo color for the entire screen background
                Color.indigo.ignoresSafeArea()

                // Main content
                VStack(spacing: 20) {
                    Spacer()

                    // App logo or title image
                    Image("ARLingoLogo") // Make sure to have an 'ARLingoLogo' image in your assets
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    // Description or slogan for the app
                    Text("Discover languages through the world around you.")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    // Object Recognition Button
                    NavigationLink(destination: Camera(), label: {
                        HStack {
                            Image(systemName: "camera.viewfinder")
                                .foregroundColor(iconColor)
                            Text("Object Recognition")
                                .fontWeight(.semibold)
                                .foregroundColor(iconColor)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonColor) // Use the adjusted button color
                        .foregroundColor(textColor)
                        .cornerRadius(15)
                    })
                    .padding(.horizontal, 30)
                    
                    // Language Selection Button
                    NavigationLink(destination: ChoicesView().environmentObject(userChoice), label: {
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(iconColor)
                            Text("Select Language")
                                .fontWeight(.semibold)
                                .foregroundColor(iconColor)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonColor) // Use the adjusted button color
                        .foregroundColor(textColor)
                        .cornerRadius(15)
                    })
                    .padding(.horizontal, 30)
                    Spacer()
                }
                .navigationBarTitle("ARLingo", displayMode: .large)
                .navigationBarItems(trailing: Image("SettingsIcon")) // Optional settings icon
            }
        }
    }
}

struct ARLingoView_Previews: PreviewProvider {
    static var previews: some View {
        ARLingoView()
    }
}



// Custom Color Extension already defined in previous example
