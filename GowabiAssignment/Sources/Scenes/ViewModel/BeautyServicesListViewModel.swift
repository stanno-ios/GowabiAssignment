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
    let servicesResource = Resource<ServiceResponse>(url: URL(string: "https://api.jsonbin.io/v3/b/6323e08ea1610e63862ceb46")!)
    let currenciesResource = Resource<CurrencyResponse>(url: URL(string: "https://api.jsonbin.io/v3/b/632351ffe13e6063dca94d91")!)
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
        let currencyResponse: Observable<CurrencyResponse> = service.fetch(from: currenciesResource)
        let servicesResponse: Observable<ServiceResponse> = service.fetch(from: servicesResource)
        items = Observable.zip(currencyResponse, servicesResponse)
            .map({ (currencyResponse, serviceResponse) in
                serviceResponse.record.services.map { service in
                    let correctCurrency = currencyResponse.record.currencies.first { currency in
                        currency.id == service.currencyID
                    }
                    return BeautyServiceViewModel(currency: correctCurrency!, service: service)
                }
            })
    }
}
