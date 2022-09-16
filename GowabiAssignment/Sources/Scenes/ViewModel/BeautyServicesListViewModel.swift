//
//  MassageListViewModel.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/16/22.
//

import Foundation
import RxSwift

class BeautyServicesListViewModel {
    
    // MARK: - Properties
    
    let title: String = "Services"
    var items: Observable<[BeautyServiceViewModel]>!
    private let bag = DisposeBag()
    private let service: NetworkService
    
    // MARK: - Initialization
    
    init(service: NetworkService = NetworkService()) {
        self.service = service
        fetchViewModels()
    }
    
    // Fetches a list of view models with a correct currency for each
    private func fetchViewModels() {
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
