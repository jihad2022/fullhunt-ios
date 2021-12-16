//
//  FullHuntApp.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 15/12/2021.
//

import Foundation
/**
 An object to manage your FullHunt app
 */
public class FullHuntApp {
    
    /// The framework configuration required to start using it
    let appConfiguration: FullHuntConfiguration
    /// The service manager to make network calls
    private let serviceManager: ServiceManagerProtocol
    /// The delegate to handle the responses
    weak var delegate: FullHuntAppDelegate?
    
    /**
     Create an app with the designated configuration
     - parameters:
        - configuration: the framework configuration
     */
    init(
        with configuration: FullHuntConfiguration,
        serviceManager: ServiceManagerProtocol = ServiceManager()
    ) {
        appConfiguration = configuration
        self.serviceManager = serviceManager
    }
    
    func getDomainDetails(for domain: String) {
        let router = Router.getDomainDetails(token: appConfiguration.apiToken, version: appConfiguration.apiVersion, domain: domain)
        serviceManager.makeNetworkRequest(
            router: router
        ) { [weak self] (result: Result<Domain, FullHuntError>) in
            switch result {
            case .success(let domain):
                self?.delegate?.getDomainDetailsEnded(with: domain, error: nil)
            case .failure(let error):
                self?.delegate?.getDomainDetailsEnded(with: nil, error: error)
            }
        }
    }
}
