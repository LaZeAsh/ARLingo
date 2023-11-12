import Foundation
class UserChoice: ObservableObject {
    @Published var language: String
    init(language: String) {
        self.language = language
    }
}
