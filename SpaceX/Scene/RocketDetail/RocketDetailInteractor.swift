//
//  RocketDetailInteractor.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RocketDetailBusinessLogic
{
    func getDetail(request: RocketDetail.Roket.Request)
}

protocol RocketDetailDataStore
{
    var id: String { get set }
}

class RocketDetailInteractor: RocketDetailBusinessLogic, RocketDetailDataStore
{
    var presenter: RocketDetailPresentationLogic?
    var worker: RocketWorker?
    var id: String = ""
    
    // MARK: Do something
    
    func getDetail(request: RocketDetail.Roket.Request)
    {
        worker = RocketWorker()
        worker?.getRocketDetail(id: self.id, completionHandler: { detail in
            let response = RocketDetail.Roket.Response(rocket: detail)
            self.presenter?.presentDetail(response: response)
        }, failure: { error in
            print(error)
        })
    }
}
