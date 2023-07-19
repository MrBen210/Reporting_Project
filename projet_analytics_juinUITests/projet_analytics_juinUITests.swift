//
//  projet_analytics_juinUITests.swift
//  projet_analytics_juinUITests
//
//  Created by Elie Bengou on 02/06/2023.
//

import XCTest

final class projet_analytics: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let app = XCUIApplication()
        XCUIDevice.shared.orientation = .landscapeLeft
        setupSnapshot(app)
        app.launch()
        snapshot("01ContentView")
        let emailTextField = app.textFields["Email"]
        emailTextField.typeText("teste@test.com")
        emailTextField.tap()
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.typeText("Test132@")
        passwordSecureTextField.tap()
        snapshot("02ConnectedView")
        app.buttons["Click"].tap()
        snapshot("03ConnectedView")
    }
    
    
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
                
            }
        }
    }
}

