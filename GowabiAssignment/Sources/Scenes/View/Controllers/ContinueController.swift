//
//  ViewController.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/15/22.
//

import UIKit
import RxSwift
import RxCocoa

class ContinueController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel = BeautyServicesListViewModel()
    let bag = DisposeBag()
    
    // MARK: - ContinueView
    
    private var continueView: ContinueView? {
        guard isViewLoaded else { return nil }
        return view as? ContinueView
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = ContinueView()
        continueView!.continueButton.rx
            .tap
            .subscribe(onNext: { [weak self] _ in
                self?.navigateToServices()
            }).disposed(by: bag)
    }
    
    // MARK: - Button action
    
    private func navigateToServices() {
        let servicesVC = AvailableServicesController()
        servicesVC.viewModel = self.viewModel
        self.navigationController?.pushViewController(servicesVC, animated: true)
    }
}

