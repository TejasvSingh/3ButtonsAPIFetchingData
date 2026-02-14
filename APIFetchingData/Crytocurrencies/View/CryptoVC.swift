//
//  CryptoVC.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//
import UIKit

class CryptoVC: UIViewController {
    // MARK: - UI Components
    
    var bitcoinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading Bitcoin price..."
        return label
    }()
    
    var ethereumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading Ethereum price..."
        return label
    }()
    
    
    // MARK: - Properties
    let viewModel: CryptoViewModelProtocol
    
    
    // MARK: - Initializer
    init(viewModel: CryptoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        loadCryptoData()
    }
    
    
    // MARK: - Setup UI
    func setupUI() {
        view.addSubview(bitcoinLabel)
        view.addSubview(ethereumLabel)
        
        NSLayoutConstraint.activate([
            bitcoinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bitcoinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bitcoinLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            ethereumLabel.topAnchor.constraint(equalTo: bitcoinLabel.bottomAnchor, constant: 25),
            ethereumLabel.leadingAnchor.constraint(equalTo: bitcoinLabel.leadingAnchor),
            ethereumLabel.trailingAnchor.constraint(equalTo: bitcoinLabel.trailingAnchor)
        ])
    }
    
    
    // MARK: - Data Loading
    func loadCryptoData() {
        Task {
            if let cryptoData = await viewModel.getCryptoDataFromServer() {
                updateUI(with: cryptoData)
            } else {
                showError()
            }
        }
    }
    
    
    // MARK: - UI Updates
    func updateUI(with cryptoData: CryptoModel) {
        if let bitcoinPrice = cryptoData.bitcoin?.usd {
            bitcoinLabel.text = "Bitcoin: $\(String(format: "%.2f", bitcoinPrice))"
        } else {
            bitcoinLabel.text = "Bitcoin: Price unavailable"
        }
        
        if let ethereumPrice = cryptoData.ethereum?.usd {
            ethereumLabel.text = "Ethereum: $\(String(format: "%.2f", ethereumPrice))"
        } else {
            ethereumLabel.text = "Ethereum: Price unavailable"
        }
    }
    
    func showError() {
        bitcoinLabel.text = "Failed to load Bitcoin price"
        ethereumLabel.text = "Failed to load Ethereum price"
    }
}
