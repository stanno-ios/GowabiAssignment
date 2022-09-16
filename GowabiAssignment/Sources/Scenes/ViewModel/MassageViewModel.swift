//
//  MassageViewModel.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/16/22.
//

import Foundation

class MassageViewModel {
    
    private var currency: Currency
    private var service: Service
    
    init(currency: Currency, service: Service) {
        self.currency = currency
        self.service = service
    }
    
    var displayTitle: String {
        return service.name + " " + String(service.price) + " " + currency.label
    }
}
