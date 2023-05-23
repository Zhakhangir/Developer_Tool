
//public class DeveloperToolManager {
//    
//    private let consoleChannel = ConsoleChannel()
//    private let inMemoryChannel = InMemoryLogStorage()
//    private let storage: ILogStorage = inMemoryChannel
//    private let menuController: DeveloperMenuViewController
//    public  let logger: ILogger = (channels: [consoleChannel, inMemoryChannel])
//    private var menuController: DeveloperMenuViewController!
//    
//    static let shared = DeveloperToolManager()
//    
//    
//    private init() { }
//    
//    func createDeveloperTool(standKeys: [String], userDefaultsKey: String) {
//        let logs = MenuItem(
//            title: " 🛰 Логи",
//            action: {
//                let logsItems = self.storage.logs(by: NetLogItem.self)
//                let vc = LogsViewController<NetworkLogCell>()
//                return vc
//            })
//        let stends = MenuItem(
//            title: " ⚙️ Стенды",
//            action: {
//                let vc = ServerSelectionViewController(standKeys: standKeys, userDefaultsKey: userDefaultsKey)
//                return vc
//            })
//        
//        menuController = DeveloperMenuViewController(items: items)
//        menuController.modalPresentationStyle = .fullScreen
//    }
//}
