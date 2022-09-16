//
//  MassageListViewModel.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/16/22.
//

import Foundation
import RxSwift

class MassageListViewModel {
    let title: String = "Services"
    var items: Observable<[MassageViewModel]>!
    var currencies: Observable<[Currency]>!
    var services: Observable<[Service]>!
    let bag = DisposeBag()
    
    private let service: MassageService
    
    init(service: MassageService = MassageService()) {
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
                   return MassageViewModel(currency: correctCurrency!, service: service)
                }
            }
    }
}
