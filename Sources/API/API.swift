import Foundation
import AWSLambdaRuntime
import AWSLambdaEvents


// TODO: Document.
public final class API: LambdaHandler {
    
    // TODO: Document.
    public init() {
        Self.shared=self
    }

    // `LambdaHandler` conformance
    public func handle(context: Lambda.Context, event: APIGateway.V2.Request, callback: @escaping (Result<APIGateway.V2.Response, Error>) -> Void) {
        
        /// executed as print statements weren't logging anything
        /// then `context.logger` was used instead, and the logging was working
        /// but also the print statements were working then too
        /// so `context.logger` is used once at the beginning of the invocation as a workaround to get print statements to appear in the logs
        context.logger.log(level: .info, "This log message exists purely as a workaround to get print statements to work properly.")
        
        Task(priority: .none, operation: { 
            // included for context, bot not required to produce error
//            do {
//                let response: APIGateway.V2.Response=try {
//                    // do `async` stuff
//                }()
//                callback(.success(response))
//            } catch {
//                callback(.failure(error))
//            }
        })
    }
    
    // TODO: Document
    internal static let environment: Environment=Environment(rawValue: ProcessInfo.processInfo.environment["ENVIRONMENT"]!)!
    
    // TODO: Document.
    internal private(set) static var shared: API!
    
    // TODO: Document
    internal enum Environment: String {
        case production, development
    }
    
    // `LambdaHandler` conformance.
    public typealias In=APIGateway.V2.Request
    
    // `LambdaHandler` conformance.
    public typealias Out=APIGateway.V2.Response
}
