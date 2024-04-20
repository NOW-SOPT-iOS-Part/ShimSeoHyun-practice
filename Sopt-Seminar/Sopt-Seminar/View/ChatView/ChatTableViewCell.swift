//
//  ChatTableViewCell.swift
//  Sopt-Seminar
//
//  Created by 심서현 on 4/20/24.
//

import UIKit

// Table View Cell
// The visual representation of single row in a table view
// 테이블 행의 내용을 관리하도록 도와주는 특수한 유형의 View
class ChatTableViewCell: UITableViewCell {
    
    // Cell의 식별자 생성하기
    // 각 셀을 구분할 수 있는 식별자
    static let identifier = "ChatTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profileImageView = UIImageView()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "PretendardVariable-Bold", size: 15)
        return label
    }()
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grey200
        label.textAlignment = .left
        label.font = UIFont(name: "PretendardVariable-Bold", size: 12)
        return label
    }()
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        return label
    }()
    
    private let itemImageView = UIImageView()
    
    
    private func setLayout() {
        [profileImageView, nameLabel, placeLabel, chatLabel, itemImageView].forEach {
            contentView.addSubview($0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nameLabel).offset(2)
        }
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        itemImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }

    

}

// data Bind 함수
extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = .defaultProfile
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = .defaultItem
    }
}
