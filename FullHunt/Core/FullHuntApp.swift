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
    
    /**
     Get domain details from API
     - parameters:
        - domain: the designated domain to lookup
     */
    func getDomainDetails(for domain: String) {
        let router = Router.getDomainDetails(
            token: appConfiguration.apiToken,
            version: appConfiguration.apiVersion,
            domain: domain
        )
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
    
    /**
     Get subdomain details from API
     - parameters:
        - subdomain: the designated subdomain to lookup
     */
    func getSubdomainDetails(for subdomain: String) {
        let router = Router.getSubdomains(
            token: appConfiguration.apiToken,
            version: appConfiguration.apiVersion,
            domain: subdomain
        )
        serviceManager.makeNetworkRequest(
            router: router
        ) { [weak self] (result: Result<Subdomain, FullHuntError>) in
            switch result {
            case .success(let subdomain):
                self?.delegate?.getSubdomainDetailsEnded(with: subdomain, error: nil)
            case .failure(let error):
                self?.delegate?.getSubdomainDetailsEnded(with: nil, error: error)
            }
        }
    }
    
    /**
     Get host details from API
     - parameters:
        - host: the designated host to lookup
     */
    func getHostDetails(for host: String) {
        let router = Router.getHostDetails(
            token: appConfiguration.apiToken,
            version: appConfiguration.apiVersion,
            host: host
        )
        serviceManager.makeNetworkRequest(
            router: router
        ) { [weak self] (result: Result<Host, FullHuntError>) in
            switch result {
            case .success(let host):
                self?.delegate?.getHostDetailsEnded(with: host, error: nil)
            case .failure(let error):
                self?.delegate?.getHostDetailsEnded(with: nil, error: error)
            }
        }
    }
}
