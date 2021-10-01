//___FILEHEADER___

import ComposableArchitecture
import Foundation

let ___FILEBASENAME___ = Reducer<___VARIABLE_productName:identifier___State, ___VARIABLE_productName:identifier___Action, ___VARIABLE_productName:identifier___Environment>.combine(
  Reducer { state, action, environment in
    switch action {
      case .binding:
        return .none
      case .viewOnAppear:
        break
      case .viewOnDisappear:
        break
      default:
        break
    }
    return .none
  }
)
  .binding()
  .debug()
