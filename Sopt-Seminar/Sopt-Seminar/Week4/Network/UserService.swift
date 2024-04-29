import Foundation

import Moya

// 싱글톤객체 선언
// 앱 어디서에서든 접근 가능
final class UserService {
    static let shared = UserService()
    private var userProvider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension UserService {
    func getUserInfo(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        // 네트워크 오류가 날경우를 방지함
        userProvider.request(.getUserInfo(memberId: memberId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, UserInfoResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    // 서버에 target의 정보를 기반으로 요청함
    // NetworkResult 타입으로 리턴 받음
    func signUp(request: SignUpRequestModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signUp(request: request)) { result in
            switch result {
            case .success(let response):
                print("🫶 memberID는 \(String(describing: response.response?.allHeaderFields["Location"]))")
                
                guard let memberId = response.response?.allHeaderFields["Location"] else { return }
                
                let auth = Auth.shared
                auth.memberId = (memberId as! String)
                
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, SignUpResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func login(request:LoginRequestModel, completion: @escaping(NetworkResult<Any>) -> Void){
        userProvider.request(.login(request:request)){ result in
            switch result {
            case .success(let response):
                print("🫶 memberID는 \(String(describing: response.response?.allHeaderFields["Location"]))")
                
                guard let memberId = response.response?.allHeaderFields["Location"] else { return }
                
                let auth = Auth.shared
                auth.memberId = (memberId as! String)
                
                let statusCode = response.statusCode
                let data = response.data
                
                
                let networkResult = self.judgeStatus(by: statusCode, data, LoginResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
            
        }
    }
    
    
    
    // 응답이 온 경우 함수를 통해 값을 확인함.
    // 2xx 인 경우 값이 유효한지 확인
    // 그외의 경우 에러값을 확인함
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    // 2xx 인경우 디코딩을 하고, 디코딩 실패시 디코딩 에러를 띄움
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }
        
        return .success(decodedData as Any)
    }
}
