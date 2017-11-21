//
//  SuperHeroDetailViewControllerTest.swift
//  KataSuperHeroesTests
//
//  Created by Óscar Manrique on 20/11/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import KIF
import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTest: ScreenshotTest {
    
    fileprivate let repository = MockSuperHeroesRepository()
    fileprivate var superHero: SuperHero! = nil

    func testShowDescriptionIfThereLoadSuperHero() {
        superHero = SuperHero(name: "Eto",
                            photo: NSURL(string: "") as URL?,
                        isAvenger: true,
                        description: "Description - Eto dfg gvasdg adsgaksdlga sdfaskljaslkdf asdf ")
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowSuperHeroWithLongName() {
        
        superHero = SuperHero(name: "Eto <sdf<sdkñf ña<sf< sdfnxzjv aweh ñaifga sjdnf lajksdnfjaejf sdjfnalksjdfn alsdfn lasdnfljans dljfnasdnfa sdfj nlasndfbx,zvxcbvewrlabwelsbdfabsd alsndfjsdjfnjsdfnjsndfljasndfj sjd sjdfnsdjf sjdfsd sdfjsdf jsfjsdf sjdfsjdfsjdf sdjfsjdfsdfsdfskdf lserweoirjñ awefjeFWIOÑERFk",
                               photo: NSURL(string: "") as URL?,
                               isAvenger: true,
                               description: "Description - Eto dfg gvasdg adsgaksdlga sdfaskljaslkdf asdf ")
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    
    fileprivate func getSuperHeroDetailViewController() -> UIViewController {
        
        let superHeroName = superHero.name
        repository.superHeroes = [superHero]
        let superHeroDetailViewController = ServiceLocator().provideSuperHeroDetailViewController(superHeroName)
            as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(ui: superHeroDetailViewController, superHeroName: superHeroName, getSuperHeroByName: GetSuperHeroByName(repository: repository))
        
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]
        return rootViewController
    }
}
