import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    // 더미데이터 선언
    private let chatList = ChatModel.dummy()

    // Table View
    // 단일 열의 행을 사용하여 데이터를 표시
    private let tableView = UITableView(frame: .zero, style: .plain) // -- 2번

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setDelegate()
        register()
    }

    private func setLayout() { // -- 3번
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    // Cell 등록하기
    private func register() {
        tableView.register(
            // 어떤 Cell을 등록할 것인지,
            ChatTableViewCell.self,
            // 해당 Cell을 식별할 수 있는 식별자
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    }
    
    // 역할 위임하기
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    
    // 몇개 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    // 어떻게 보여줄 것인지?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // 재사용 큐에서 필요한 cell을 dequeue 하기 위함
            guard let cell = tableView.dequeueReusableCell(
                // 식별자로 재사용 큐 안에서 구별
                // tableView의 행을 식별하기 위해 TableView indexPath를 사용
                // 0 부터 시작됨
                withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
