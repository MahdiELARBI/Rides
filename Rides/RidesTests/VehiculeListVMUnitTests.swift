//
//  VehiculeListVMUnitTests.swift
//  RidesTests
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import Foundation
import XCTest
import Rides

class VehiculeListVMUnitTests: XCTestCase {

 
    private var  viewModel: VehiculeListVM!
    
    override func setUp() async throws {
        viewModel = VehiculeListVM()
    }
    
    
// Mark: Tests to confirm if value is an integer in the range of 1 to 100
    
    func testIfInputIsIntegerAndInRange_ExceptScuccess() {
        let randomIntInRange = Int.random(in: 1...100)
        viewModel.searchText = String(randomIntInRange)
        let successResult = viewModel.isInputInRange()
        XCTAssertTrue(successResult, "It is valid")
    }
    
    func testIfInputIsIntegerButNotInRange_ExceptFailing() {
        let randomIntNotInRange =  Int.random(in: 101...1000)
        viewModel.searchText = String(randomIntNotInRange)
        let failResult = viewModel.isInputInRange()
        XCTAssertFalse(failResult, "It is valid")
    }
    
    func testIfInputIsNotInteger_ExceptFailing() {
        viewModel.searchText = randomString()
        let failResult = viewModel.isInputInRange()
        XCTAssertFalse(failResult, "It is valid")
    }
    
    // generate random string with 3 characters as length
    private func randomString() -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<3).map{ _ in letters.randomElement()! })
    }
    
    override func tearDown() async throws {
        viewModel = nil
    }
}
