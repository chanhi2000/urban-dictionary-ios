// swiftlint:disable all
import Amplify
import Foundation

public struct SearchedTerm: Model {
  public let id: String
  public var value: String
  public var description: String?
  
  public init(id: String = UUID().uuidString,
      value: String,
      description: String? = nil) {
      self.id = id
      self.value = value
      self.description = description
  }
}