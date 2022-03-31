import Foundation
import AWSLambdaRuntime


Lambda.run({ () -> Lambda.Handler in
    switch API.environment {
    case .production: return API()
    case .development: return DevelopmentAPI()
    }
}())
