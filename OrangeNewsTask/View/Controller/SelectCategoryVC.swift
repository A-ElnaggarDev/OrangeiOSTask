//
//  SelectCategoryVC.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import UIKit
import RxSwift
import RxCocoa

class SelectCategoryVC: UIViewController {
    
    @IBOutlet weak var categoryTblView: UITableView!
    
    lazy var viewModel: SelectCategoryViewModel = {
        return SelectCategoryViewModel()
    }()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTblView.separatorStyle = .none
        setNavTitle()
        getTableViewCell()
        selectedCell()
    }
    
    
    func setNavTitle() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getTableViewCell() {
        viewModel.getCountry().bind(to: categoryTblView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.name
            cell.textLabel?.textAlignment = .center
        }.disposed(by: disposeBag)
    }
    
    func selectedCell() {
        categoryTblView.rx.modelSelected(CategoryData.self).subscribe (onNext: { category in
            print(category.name)
            
            //            let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "selectCategoryVC") as! SelectCategoryVC
            //            self.navigationController?.pushViewController(categoryVC, animated: true)
        }).disposed(by: disposeBag)
    }
    
}
