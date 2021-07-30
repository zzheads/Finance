//
//  Resolver+.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import Swinject

extension Resolver {
    func resolve<ServiceType>() -> ServiceType {
        guard let service = resolve(ServiceType.self) else {
            fatalError("Can not resolve service: \(ServiceType.self)")
        }
        return service
    }
}
