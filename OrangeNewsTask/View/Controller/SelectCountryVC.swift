//
//  ViewController.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import UIKit
import RxCocoa
import RxSwift

class SelectCountryVC: UIViewController {

    @IBOutlet weak var countryTblView: UITableView!
    
    lazy var viewModel: SelectCountryViewModel = {
        return SelectCountryViewModel()
    }()
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavTitle()
        getTableViewCell()
        selectedCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Core.shared.deleteObject(key: "country")
    }
    
    func setNavTitle() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getTableViewCell() {
        viewModel.getCountry().bind(to: countryTblView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.name
            cell.textLabel?.textAlignment = .center
        }.disposed(by: disposeBag)
    }
    
    func selectedCell() {
        countryTblView.rx.modelSelected(CountryData.self).subscribe (onNext: { country in
            Core.shared.setCountry(country: country.code)
            let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "selectCategoryVC") as! SelectCategoryVC
            self.navigationController?.pushViewController(categoryVC, animated: true)
        }).disposed(by: disposeBag)
    }

}

