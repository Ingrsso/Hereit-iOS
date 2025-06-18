import Foundation

final class LoginViewModel {
    var email : String = ""
    func login(email: String, password: String) {
        self.email = email
        print("Logging in with email: \(email), password: \(password)")
    }
    
}
