import Foundation

// 회원가입의 Response Body
// Json을 Decode해서 구조체로 만든 데이터 모델로 반환하기 위해서 Codable 프로토콜 채택
struct SignUpResponseModel: Codable {
    let code: Int
    let message: String
}
