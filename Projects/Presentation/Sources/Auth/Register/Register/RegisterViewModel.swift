import Foundation

final class RegisterViewModel {
    var email : String = ""
    var password : String = ""
    var fullName : String = ""
    
    func register(fullName: String, email: String, password: String) {
        self.email = email
        self.password = email
        self.fullName = email
        print("Logging in with email: \(email), password: \(password)")
    }
    
}
