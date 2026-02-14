//
//  ViewController.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

import UIKit

class ButtonsVC: UIViewController {
    // MARK: - UI Components
    let usersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Users", for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(goNextUserScreen), for: .touchUpInside)
        return button
    }()
    
    let cryptoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Crypto", for: .normal)
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(goNextCryptoScreen), for: .touchUpInside)
        return button
    }()
    
    let peopleButton: UIButton = {
        let button = UIButton()
        button.setTitle("People", for: .normal)
        button.frame = CGRect(x: 100, y: 600, width: 200, height: 50)
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.addTarget(self, action: #selector(goNextPeopleScreen), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "API Fetching"
        view.backgroundColor = .white
        
        view.addSubview(usersButton)
        view.addSubview(cryptoButton)
        view.addSubview(peopleButton)
    }
    
    
    // MARK: - Navigation
    @objc func goNextPeopleScreen() {
        let viewModel = PeopleViewModel(service: UsersNetworkManager())
        let secondVC = PeopleVC(viewModel: viewModel)
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func goNextUserScreen() {
        let viewModel = UsersViewModel(service: UsersNetworkManager())
        let secondVC = UsersView(viewModel: viewModel)
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func goNextCryptoScreen() {
        let viewModel = CryptoViewModel(service: UsersNetworkManager())
        let thirdVC = CryptoVC(viewModel: viewModel)
        navigationController?.pushViewController(thirdVC, animated: true)
    }
}
