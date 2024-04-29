import Foundation

// 1. 요청모델 만들기
struct LoginRequestModel: Codable {
    let authenticationId: String
    let password: String
}
