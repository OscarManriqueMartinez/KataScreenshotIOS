//
//  SuperHeroTableViewCellTests.swift
//  KataScreenshot
//
//  Created by Sergio Gutiérrez on 09/01/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import UIKit
import XCTest
@testable import KataScreenshot

class SuperHeroTableViewCellTests: ScreenshotTest {

    private let superHeroAvenger = SuperHero(name: "SuperHero - 1",
        photo: URL(string: ""),
        isAvenger: true, description: "Description - 1")
    private let superHeroNoAvenger = SuperHero(name: "SuperHero - 2",
                                             photo: URL(string: ""),
                                             isAvenger: false, description: "Description - 2")
    
    private func givenASuperHeroTableViewCell() -> SuperHeroTableViewCell {
        return UINib(nibName: "SuperHeroTableViewCell", bundle: Bundle.main).instantiate(withOwner: self, options: nil)[0] as! SuperHeroTableViewCell
    }
    
    
    func testShowBadgeIsSuperHeroIsAvenger(){
        
        let cell = givenASuperHeroTableViewCell()
        cell.configure(forItem: superHeroAvenger)
        
        verify(view: cell)
    }
    
    func testShowBadgeIsSuperHeroIsNotAvenger(){
        
        let cell = givenASuperHeroTableViewCell()
        cell.configure(forItem: superHeroNoAvenger)
        
        verify(view: cell)
    }
}
