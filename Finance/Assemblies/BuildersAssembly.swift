//
//  BuildersAssembly.swift
//  Finance
//
//  Created by Папин Алексей Валерьевич on 02.08.2021.
//

import Swinject

class BuildersAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RowsBuilder.self) { _ in
            DefaultRowsBuilder(appearance: .default)
        }
    }
}
