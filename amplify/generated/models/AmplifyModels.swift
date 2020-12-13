// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "a6ca205b4232cd5dcd75fd9b25623515"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: SearchedTerm.self)
  }
}