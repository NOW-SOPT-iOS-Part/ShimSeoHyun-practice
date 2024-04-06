import Foundation
import UIKit

final class WelcomeViewController: UIViewController {
    // Optional type
    // 변수는 값이 있을 수도 없을 수도 있는 변수.
    private var id: String?
    
    //함수를 이용해서 private하게 선언된 변수들을 바꾸어 주는 과정 LoginViewController에서 사용됨.
    func setLabelText(id: String?) {
           self.id = id
       }

    //사진
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "당근")
        return imageView
    }()
    
    //라벨
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "PretendardVariable-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Bold", size: 18)
        
        button.layer.cornerRadius = 6
        
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = .grey200
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Bold", size: 18)
        
        button.layer.cornerRadius = 6
        
        // 버튼을 클릭하면 LoginView로 돌아감
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        
        // LoginView의 id 값을 WelcomeViewcontroller로 전달
        bindID()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
