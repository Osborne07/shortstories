//
//  Kids_Stories_AssignmentsUITestsLaunchTests.swift
//  Kids_Stories_AssignmentsUITests
//
//  Created by Snehal Shrikant Patil on 03/04/23.
//

import XCTest

final class Kids_Stories_AssignmentsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
