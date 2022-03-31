import AWSLambdaEvents
import AWSLambdaRuntime
import Foundation


// TODO: Document.
internal final class DevelopmentAPI: LambdaHandler {
    
    // TODO: Document.
    private let api: API
    
    // TODO: Document.
    internal init() {
        self.api = .init()
    }

    // `LambdaHandler` conformance
    public func handle(context: Lambda.Context, event: APIGateway.V2.Request, callback: @escaping (Result<Out, Error>) -> Void) {
        self.api.handle(context: context, event: event, callback: { [callback] in
            switch $0 {
            case let .success(response): callback(.success(response.body!))
            case let .failure(error): callback(.failure(error))
            }
        })
    }
    
    // `LambdaHandler` conformance
    public typealias In=APIGateway.V2.Request
    
    // `LambdaHandler` conformance
    public typealias Out=String
    
}
