//
//  HomeVC.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {

    @IBOutlet weak var newsSearchBar: UISearchBar!
    @IBOutlet weak var newsTblView: UITableView!
    
    let disposeBag = DisposeBag()
    
    lazy var viewModel: HomeViewModel = {
        return HomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            setNavTitle()
            getNewsList()
            openSafari()
        }
    
    func setNavTitle() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getNewsList() {
        viewModel.getHeadlinesList(country: Core.shared.getCountryCode()!, category: Core.shared.getCategory()!)
            .observe(on: MainScheduler.instance)
            .bind(to: newsTblView.rx.items(cellIdentifier: "cell", cellType: HomeTblViewCell.self)) { index, viewModel, cell in
            
            cell.newsTitleLbl.text = viewModel.title
            cell.newsDescriptionLbl.text = viewModel.description
            cell.newsSourceLbl.text = viewModel.source?.name
            cell.newsDateLbl.text = viewModel.publishedAt
            cell.newsImage.loadImage(with: viewModel.urlToImage ?? "")
        }.disposed(by: disposeBag)
    }
    
    func openSafari() {
        newsTblView.rx.modelSelected(ArticlesData.self).subscribe (onNext: { article in
                if let url = URL(string: article.url!) {
                    print(url)
                    UIApplication.shared.open(url)
                }
        }).disposed(by: disposeBag)
    }
}
