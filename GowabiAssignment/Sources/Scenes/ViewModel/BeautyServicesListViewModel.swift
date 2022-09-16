//
//  MassageListViewModel.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/16/22.
//

import Foundation
import RxSwift

class BeautyServicesListViewModel {
    let title: String = "Services"
    var items: Observable<[BeautyServiceViewModel]>!
    let bag = DisposeBag()
    
    private let service: BeautyService
    
    init(service: BeautyService = BeautyService()) {
        self.service = service
        fetchViewModels()
    }
    
    func fetchViewModels() {
        items = Observable.zip(service.fetchCurrencies(), service.fetchServices())
            .map { (cur, ser) in
                ser.map { service in
                    let correctCurrency = cur.first { currency in
                        currency.id == service.currencyID
                    }
                   return BeautyServiceViewModel(currency: correctCurrency!, service: service)
                }
            }
    }
}
