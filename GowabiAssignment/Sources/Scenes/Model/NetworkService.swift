//
//  MassageService.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/15/22.
//

import Foundation
import RxSwift
import Alamofire

class NetworkService {
    // Fetches a list of currencies
    func fetchCurrencies() -> Observable<[Currency]> {
        let url = "https://api.jsonbin.io/v3/b/632351ffe13e6063dca94d91"
        return Observable<[Currency]>.create { observer -> Disposable in
            AF.request(url)
                .validate()
                .responseDecodable(of: CurrencyResponse.self) { data in
                    guard let result = data.value?.record.currencies else { return }
                    observer.onNext(result)
                }
            return Disposables.create { }
        }
    }
    
    // Fetches a list of services
    func fetchServices() -> Observable<[Service]> {
        let url = "https://api.jsonbin.io/v3/b/6323e08ea1610e63862ceb46"
        return Observable<[Service]>.create { observer -> Disposable in
            AF.request(url)
                .validate()
                .responseDecodable(of: ServiceResponse.self) { data in
                    guard let result = data.value?.record.services else { return }
                    observer.onNext(result)
                }
            return Disposables.create { }
        }        
    }
}
