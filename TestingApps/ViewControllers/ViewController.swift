import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let username = "Paul"
    private let password = "123"
    
    @IBAction func loginButtonDidTapped() {
        if !(usernameTextField.text == username && passwordTextField.text == password) {
            showAlert(title: "Error!", message: "Login or password is invalid")
        }
    }
    
    @IBAction func forgotUsernameButtonDIdTapped() {
        showAlert(title: "", message: "Your username is: \(username)")
    }
    
    
    @IBAction func forgotPasswordButtonDidTapped() {
        showAlert(title: "", message: "Your password is: \(password)")
    }
}

private extension LoginViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = nil
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
