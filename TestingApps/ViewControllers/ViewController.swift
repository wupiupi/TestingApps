import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let username = "Paul"
    private let password = "123"
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aboutVC = segue.destination as? AboutViewController
        aboutVC?.username = username
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
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
