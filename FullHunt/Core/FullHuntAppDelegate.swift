//
//  FullHuntAppDelegate.swift
//  FullHunt
//
//  Created by Jihad Mahmoud on 16/12/2021.
//

import Foundation
/**
 A delegate to get the framework response
 */
protocol FullHuntAppDelegate: AnyObject {
    /**
     Get domain details is a delegate function to handle the result of a GET domainDetails request from the FullHunt public API
     - parameters:
        - domain: the designated domain to lookup
        - error: an error will be returned in case of any error occured
     */
    func getDomainDetailsEnded(with domain: Domain?, error: FullHuntError?)
    /**
     Get subdomain details is a delegate function to handle the result of a GET subdomainDetails request from the FullHunt public API
     - parameters:
        - subdomain: the designated subdomain to lookup
        - error: an error will be returned in case of any error occured
     */
    func getSubdomainDetailsEnded(with subdomain: Subdomain?, error: FullHuntError?)
    /**
     Get host details is a delegate function to handle the result of a GET hostDetails request from the FullHunt public API
     - parameters:
        - host: the designated host to lookup
        - error: an error will be returned in case of any error occured
     */
    func getHostDetailsEnded(with host: Host?, error: FullHuntError?)
}
