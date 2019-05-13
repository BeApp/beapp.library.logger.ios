import XCTest
import BeappLogger

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormatter() {
        let tinyFormatter = TinyFormatter()
        let formatedString = tinyFormatter.format("test Message", filename: "", line: 0, funcName: "", priority: .debug)
        XCTAssert("[💬] test Message" == formatedString)
    }
    
    func testLogger() {
        let dummyAppender = DummyAppender()
        Logger.build(with: dummyAppender)
        Logger.formatter = DummyLogger()
        Logger.debug("test Message")
        Logger.info("test Message")
        Logger.warn("test Message")
        Logger.error("test Message")
        XCTAssert(dummyAppender.loglist.contains("formatted:DEBUG:test Message"))
        XCTAssert(dummyAppender.loglist.contains("formatted:INFO:test Message"))
        XCTAssert(dummyAppender.loglist.contains("formatted:WARN:test Message"))
        XCTAssert(dummyAppender.loglist.contains("formatted:ERROR:test Message"))
    }
    
    private class DummyLogger: LoggerFormatter {
        func format(_ object: Any?, filename: String, line: Int, funcName: String, priority: LoggerPriority) -> String {
            let priorityString: String
            switch priority {
            case .debug:
               priorityString = "DEBUG"
            case .info:
               priorityString = "INFO"
            case .warn:
                priorityString = "WARN"
            case .error:
                priorityString = "ERROR"
            }
            return "formatted:\(priorityString):\(object ?? "NIL")"
        }
        
        
    }
    private class DummyAppender: LoggerAppender {
        fileprivate var loglist: [String] = []
        func log(priority: LoggerPriority, message: String) {
            loglist.append(message)
        }
    }
}
