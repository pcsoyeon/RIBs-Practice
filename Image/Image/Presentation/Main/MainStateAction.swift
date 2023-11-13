//
//  MainStateAction.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import UIKit

import ReactorKit
import RIBs
import RxSwift

protocol MainPresentableListener: AnyObject {
    func loadImage() -> Observable<UIImage>
}

struct MainState {
    var image: UIImage?
}

enum MainAction {
    case loadImage
}
