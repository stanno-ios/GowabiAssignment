//
//  MassageViewModel.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/16/22.
//

import Foundation

class BeautyServiceViewModel {
    
    // MARK: - Properties
    
    private var currency: Currency
    private var service: Service
    
    var displayTitle: String {
        return "\(service.name) \(service.price) \(currency.label)"
    }
    
    // MARK: - Initialization
    
    init(currency: Currency, service: Service) {
        self.currency = currency
        self.service = service
    }
}
