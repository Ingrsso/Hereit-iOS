import Foundation

final class AuthViewModel {
    var email : String = ""
    func login(email: String, password: String) {
        self.email = email
        print("Logging in with email: \(email), password: \(password)")
    }
    func signup(fullName: String,email: String, password: String) {
        print("Logging in with fullName: \(fullName) email: \(email), password: \(password)")
    }
}
