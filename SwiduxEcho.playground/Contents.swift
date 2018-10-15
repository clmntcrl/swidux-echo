/*:
 # SwiduxEcho

 Logger middleware for Swidux
*/
import Swidux
import SwiduxEcho

struct AppState {
    var count = 0
}

enum CounterAction: Action {
    case increment
    case decrement
    case reset(Int)
}

let counterReducer = Reducer<Int> { state, action in
    switch action {
    case CounterAction.increment: state += 1
    case CounterAction.decrement: state -= 1
    case CounterAction.reset(let count): state = count
    default: break
    }
}

let store = Store<AppState>(
    initialState: AppState(),
    reducer: counterReducer.lift(\.count),
    middlewares: [ echo() ]
)

store.dispatch(CounterAction.increment)
store.dispatch(CounterAction.increment)
store.dispatch(CounterAction.reset(-1))
store.dispatch(CounterAction.increment)
store.dispatch(CounterAction.decrement)
/*:
 _Take a look at the console... 👇_
*/
