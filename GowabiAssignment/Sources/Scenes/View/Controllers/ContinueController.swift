//
//  ViewController.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/15/22.
//

import UIKit

class ContinueController: UIViewController {
    
    let viewModel = MassageListViewModel()
    
    private var continueView: ContinueView? {
        guard isViewLoaded else { return nil }
        return view as? ContinueView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = ContinueView()
        viewModel.fetchViewModels()
        print(viewModel.items)
    }
}

