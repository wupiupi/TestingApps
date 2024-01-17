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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == username, passwordTextField.text == password else {
            showAlert(title: "Error", message: "Invalid data") {
                self.passwordTextField.text = nil
            }
            return false
        }
        return true
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotUsernameButtonDIdTapped() {
        showAlert(title: "", message: "Your username is: \(username)")
    }
    
    @IBAction func forgotPasswordButtonDidTapped() {
        showAlert(title: "", message: "Your password is: \(password)")
    }
}

private extension LoginViewController {
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
