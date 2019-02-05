//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import Foundation
import Swidux

private let echoQueue = DispatchQueue(label: "io.clmntcrl.echo-queue", qos: .utility)

public func echo<AppState>() -> Middleware<AppState> {
    return Middleware { store in
        return { dispach in
            return { action in
                dispach(action)
                print("""

                ▹ \(snap(action).dropFirst(2))
                \(snap(store.getState()))

                """)
            }
        }
    }
}
