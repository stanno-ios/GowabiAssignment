//
//  AvailableServicesController.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/16/22.
//

import UIKit
import RxSwift
import RxCocoa

class AvailableServicesController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: BeautyServicesListViewModel!
    let bag = DisposeBag()
    
    // MARK: - AvailableServicesView
    
    private var availableServicesView: AvailableServicesView? {
        guard isViewLoaded else { return nil }
        return view as? AvailableServicesView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = AvailableServicesView()
        self.bindViewModel()
        self.title = viewModel.title
    }
    
    // MARK: - Rx binding
    
    func bindViewModel() {
        guard let availableServicesView = availableServicesView else { return }
        self.viewModel.items
            .asObservable()
            .observe(on: MainScheduler.instance)
            .bind(to: availableServicesView.tableView.rx.items(cellIdentifier: "cell")) { _, model, cell in
                var cellContent = cell.defaultContentConfiguration()
                cellContent.text = model.displayTitle
                cellContent.textProperties.font = .systemFont(ofSize: 24)
                cell.contentConfiguration = cellContent
            }.disposed(by: self.bag)
    }
}
