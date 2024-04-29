import Foundation
import UIKit

final class WelcomeViewController: UIViewController {
    let memberId = Auth.shared.memberId
    
    typealias handler = ((String) -> (Void))
    var completionHandler: handler?
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    
//    private lazy var backToLoginButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
//        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
//        button.setTitle("다시 로그인", for: .normal)
//        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
//        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
//        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
//        return button
//    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        requestUserInfo()
    }
    
    private func requestUserInfo() {
        //memeberId에 아까 받은 멤버 아이디 직접 넣어주기
        UserService.shared.getUserInfo(memberId: memberId!) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? UserInfoResponseModel else {
                    return }
                self?.welcomeLabel.text = "\(data.data.nickname)님 \n반가워요!"
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton].forEach {
            self.view.addSubview($0)
        }
    }

}
