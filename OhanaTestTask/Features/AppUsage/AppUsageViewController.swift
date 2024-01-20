//
//  ViewController.swift
//  OhanaTestTask
//
//  Created by Serhan Khan on 20/01/2024.
//

import UIKit
import Combine

class AppUsageViewController: UIViewController {

    private let viewModel = AppUsageViewModel()
    private var cancellables = Set<AnyCancellable>()

    private lazy var dataSource: TableViewDataSource = makeDataSource()
    
    @IBOutlet private var tableView: UITableView! {
        willSet {
            newValue.tableFooterView = UIView()
            newValue.contentInsetAdjustmentBehavior = .never
            newValue.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
            newValue.register(cellType: ByAppTableViewCell.self)
            newValue.register(cellType: ByCategoryTableViewCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchAppUsages()
    }
    
    private func bindViewModel() {
        viewModel.viewState.sink(receiveValue: { [weak self] in
            switch $0 {
            case let .error(error):
                print("show error alert = \(error)")
            case .finished:
                print("stop loading spinner")
            case .noData:
                print("no data provided")
            case let .succes(data):
                self?.updateTableView(sections: data)
                break
            case .loading:
                print("show loading indicator")
            }
        }).store(in: &cancellables)
    }
    
    private func updateTableView(sections: [AppUsageViewModel.TableViewSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<AppUsageViewModel.TableViewSection, AnyHashable>()
        
        defer {
            self.dataSource.apply(snapshot)
        }
        
        sections.forEach {
            switch $0 {
            case let .byApp(items):
                snapshot.appendSections([.byApp(items: items)])
                snapshot.appendItems(items, toSection: .byApp(items: items))
            case let .byCategories(items):
                snapshot.appendSections([.byCategories(items: items)])
                snapshot.appendItems(items, toSection: .byCategories(items: items))
            }
        }
    }
    
    
    /// Create our diffable data source
    /// - Returns: Diffable data source
    private func makeDataSource() -> TableViewDataSource {
        return TableViewDataSource(tableView: tableView) { tableView, indexPath, item in
            if let byApp = item as? ByApp {
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ByAppTableViewCell.self)
                cell.updateView(item: byApp)
                return cell
            } else if let byCategory = item as? ByCategory {
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ByCategoryTableViewCell.self)
                cell.updateView(item: byCategory)
                return cell
            } else {
                fatalError("Unknown cell type")
            }
        }
    }
}



// MARK: - NewsOverviewTableViewDataSource
class TableViewDataSource: UITableViewDiffableDataSource<AppUsageViewModel.TableViewSection, AnyHashable> {
    //return the titles for tableview sections
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.snapshot().sectionIdentifiers[section]
        return section.title
    }
}
