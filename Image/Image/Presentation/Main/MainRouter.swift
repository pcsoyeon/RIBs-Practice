//
//  MainRouter.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import RIBs

protocol MainInteractable: Interactable, DetailListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class MainRouter: 
    LaunchRouter<MainInteractable,
    MainViewControllable>,
    MainRouting
{
    
    // MARK: - Properties
    
    private let detailBuilder: DetailBuildable
    private var detailRouter: DetailRouting?
    
    init(
        interactor: MainInteractable, 
        viewController: MainViewControllable,
        detailBuilder: DetailBuildable
    ) {
        self.detailBuilder = detailBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachDetailRIB() {
        let detailRouter = detailBuilder.build(withListener: interactor)
        self.detailRouter = detailRouter
        attachChild(detailRouter)
        viewController.present(viewController: detailRouter.viewControllable)
    }
    
}
