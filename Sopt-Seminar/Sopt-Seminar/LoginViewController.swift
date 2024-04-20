import UIKit

final class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.view.backgroundColor = .white
        setTarget()
    }
        
    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
        
    @objc private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
        
    private func pushToWelcomeVC() {
//            let welcomeViewController = WelcomeViewController()
//            self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
 }
