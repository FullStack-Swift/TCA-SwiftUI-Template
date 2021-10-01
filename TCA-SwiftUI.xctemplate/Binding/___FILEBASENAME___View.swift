//___FILEHEADER___

import ComposableArchitecture
import SwiftUI

struct ___FILEBASENAME___: View {
  
  private let store: Store<___VARIABLE_productName:identifier___State, ___VARIABLE_productName:identifier___Action>
  
  @ObservedObject
  private var viewStore: ViewStore<ViewState, ViewAction>
  
  init(store: Store<___VARIABLE_productName:identifier___State, ___VARIABLE_productName:identifier___Action>? = nil) {
    let unwrapStore = store ?? Store(initialState: ___VARIABLE_productName:identifier___State(), reducer: ___VARIABLE_productName:identifier___Reducer, environment: ___VARIABLE_productName:identifier___Environment())
    self.store = unwrapStore
    self.viewStore = ViewStore(unwrapStore.scope(state: ViewState.init, action: ___VARIABLE_productName:identifier___Action.init))
  }
  
  var body: some View {
    ZStack {
      Text("Empty")
    }
    .onAppear {
      viewStore.send(.viewOnAppear)
    }
    .onDisappear {
      viewStore.send(.viewOnDisappear)
    }
  }
}

struct ___FILEBASENAME____Previews: PreviewProvider {
  static var previews: some View {
    ___FILEBASENAME___()
  }
}

fileprivate struct ViewState: Equatable {
  @BindableState var nested = ___VARIABLE_productName:identifier___State.Nested()
  init(state: ___VARIABLE_productName:identifier___State) {
    self.nested = state.nested
  }
}

fileprivate enum ViewAction: Equatable {
  case viewOnAppear
  case viewOnDisappear
  case none
  case binding(BindingAction<ViewState>)
  init(action: ___VARIABLE_productName:identifier___Action) {
    switch action {
      case .viewOnAppear:
        self = .viewOnAppear
      case .viewOnDisappear:
        self = .viewOnDisappear
      default:
        self = .none
    }
  }
}

fileprivate extension ___VARIABLE_productName:identifier___State {
  var viewState: ViewState {
    get {
      ViewState(state: self)
    }
    set {
      self.nested = newValue.nested
    }
  }
}

fileprivate extension ___VARIABLE_productName:identifier___Action {
  init(action: ViewAction) {
    switch action {
      case .viewOnAppear:
        self = .viewOnAppear
      case .viewOnDisappear:
        self = .viewOnDisappear
      case .binding(let bindingAction):
        self = .binding(bindingAction.pullback(\___VARIABLE_productName:identifier___State.viewState))
      default:
        self = .none
    }
  }
}
