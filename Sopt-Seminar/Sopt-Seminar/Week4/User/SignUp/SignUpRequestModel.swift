import Foundation

struct SignUpRequestModel: Codable {
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}
