//___FILEHEADER___

import ComposableArchitecture
import SwiftUI

struct ___FILEBASENAME___Reducer: ReducerProtocol {
  
  // MARK: State
  struct State: Equatable {
    
  }
  
  // MARK: Action
  enum Action {
    case viewOnAppear
    case viewOnDisappear
    case none
  }
  
  // MARK: Dependency
  @Dependency(\.uuid) var uuid
  
  // MARK: Reducer
  var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
        case .viewOnAppear:
          break
        case .viewOnDisappear:
          break
        default:
          break
      }
      return .none
    }
    ._printChanges()
  }
  
}

struct ___FILEBASENAME___View: View {
  
  private let store: StoreOf<___FILEBASENAME___Reducer>
  
  @ObservedObject
  private var viewStore: ViewStoreOf<___FILEBASENAME___Reducer>
  
  init(store: StoreOf<___FILEBASENAME___Reducer>? = nil) {
    let store = store ?? Store(
      initialState: ___FILEBASENAME___Reducer.State(),
      reducer: ___FILEBASENAME___Reducer()
    )
    self.store = store
    self.viewStore = ViewStore(store)
  }
  
  var body: some View {
    ZStack {
      Text(String(describing: Self.self))
    }
    .onAppear {
      viewStore.send(.viewOnAppear)
    }
    .onDisappear {
      viewStore.send(.viewOnDisappear)
    }
  }
}

struct ___FILEBASENAME____View_Previews: PreviewProvider {
  static var previews: some View {
    ___FILEBASENAME___View()
  }
}
