import SwiftUI

class UserSelection: ObservableObject {
    @Published var selectedChoice: String?
}

struct ChoicesView: View {
    @EnvironmentObject var userSelection: UserSelection

    let choices = ["🇯🇵\nJapanese", "🇫🇷\nFrance", "🇪🇸\nSpanish"]
    var body: some View {
        VStack(spacing: 20) {
            Text("Please select an option:")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)

            ForEach(choices, id: \.self) { choice in
                Button(action: {
                    userSelection.selectedChoice = choice
                }) {
                    Text(choice)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(userSelection.selectedChoice == choice ? Color.white.opacity(0.5) : Color.white)
                        .foregroundColor(userSelection.selectedChoice == choice ? .indigo : .gray)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 30)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo.ignoresSafeArea())
        .navigationBarTitle("Choose an Option", displayMode: .inline)
    }
}

// Preview for ChoicesView with environment object
struct ChoicesView_Previews: PreviewProvider {
    static var previews: some View {
        ChoicesView().environmentObject(UserSelection())
    }
}
