//
//  UserProfileViewControllerTest.swift
//  grAPPleTests
//
//  Created by Paweł Czapran on 27/05/2024.
//

import XCTest
@testable import grAPPle

final class UserProfileViewControllerTest: XCTestCase {

    func testUserInfoViewModelMockDataLoadedCorrectly() {
        // Given
        let vm = UserProfileViewModel()
        
        
        // When
        vm.initialize()
        
        // Then
        XCTAssertEqual(vm.name.value, "Mateusz")
        XCTAssertEqual(vm.description.value, "Serce ze złota")
        XCTAssertEqual(vm.trainingsCount.value, 15)
        XCTAssertEqual(vm.belt.value, .Blue)
        XCTAssertEqual(vm.favoriteTechnique.value, "Taktarov")
    }

}
