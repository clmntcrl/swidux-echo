//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import Foundation
import Swidux

private let echoQueue = DispatchQueue(label: "io.clmntcrl.echo-queue", qos: .utility)


public func echo<AppState>() -> Middleware<AppState> {
    return Middleware { store, action in
        #if DEBUG
            // Copy state
            let state = store.state
            // Dispatch logging closure on the echo queue
            echoQueue.async {
                print("\n\(action)\n")
                dump(state)
                print("\n")
            }
        #endif
    }
}
