// swiftlint:disable all
import Amplify
import Foundation

extension SearchedTerm {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case value
    case description
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let searchedTerm = SearchedTerm.keys
    
    model.pluralName = "SearchedTerms"
    
    model.fields(
      .id(),
      .field(searchedTerm.value, is: .required, ofType: .string),
      .field(searchedTerm.description, is: .optional, ofType: .string)
    )
    }
}