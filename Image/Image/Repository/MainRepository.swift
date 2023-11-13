//
//  MainRepository.swift
//  Image
//
//  Created by 김소연 on 11/13/23.
//

import UIKit

import RxSwift

protocol MainRepository {
    func showImage() -> Observable<UIImage>
}

final class MainRepositoryImpl: MainRepository {
    func showImage() -> Observable<UIImage> {
        Observable.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                let images: [UIImage] = [.add, .actions, .checkmark]
                let randomIndex = Int.random(in: 0...images.count - 1)
                observer.onNext(images[randomIndex])
            })
            return Disposables.create()
        }
    }
}
