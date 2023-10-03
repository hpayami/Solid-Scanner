    //
    // Copyright © 1402 AP Hossein Payami. All rights reserved.
    //

import Foundation
import Combine
import SwiftUI

    // MARK: - API Definitions

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"

        

        // Example method to check if the HTTP method is safe:
    func isSafe() -> Bool {
        return self == .get
    }

        // Example method to check if the HTTP method is idempotent:
    func isIdempotent() -> Bool {
        return self == .get || self == .put || self == .delete
    }



        // Example computed property to get the HTTP method name in uppercase:
    var uppercaseName: String {
        return self.rawValue.uppercased()
    }
}

enum APIError: Error {
    case invalidResponse
    case invalidData


        // Example computed property to provide a user-friendly error message:
    var localizedDescription: String {
        switch self {
            case .invalidResponse:
                return "The server response was invalid."
            case .invalidData:
                return "The data received from the server was invalid."
        }
    }

        // Example method to log the error message:
    func log() {
        print("API Error: \(localizedDescription)")
    }


}


enum UserEndpoint: APIEndpoint {
    case getUsers

    var baseURL: URL {
        return URL(string: "http://localhost:3000/api")!
    }

    var path: String {
        switch self {
            case .getUsers:
                return "/users"
        }
    }

    var method: HTTPMethod {
        switch self {
            case .getUsers:
                return .get
        }
    }

    var headers: [String: String]? {
        switch self {
            case .getUsers:
                return ["Authorization": "Bearer TOKEN"]
        }
    }

    var parameters: [String: Any]? {
        switch self {
            case .getUsers:
                return ["page": 1, "limit": 10]
        }
    }
}

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

    // MARK: - User Service

protocol UserServiceProtocol {
    func getUsers() -> AnyPublisher<[User], Error>
}

class UserService: UserServiceProtocol {
    let apiClient = URLSessionAPIClient<UserEndpoint>()

    func getUsers() -> AnyPublisher<[User], Error> {
        return apiClient.request(.getUsers)
    }
}



    // MARK: - Models

struct User: Decodable, Identifiable {
    var id: Int
    var name: String
    var email: String
    var age: Int
    var address: String
    var profileImageURL: URL?



        // Example initializer (you can customize it):
    init(id: Int, name: String, email: String, age: Int, address: String, profileImageURL: URL? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.age = age
        self.address = address
        self.profileImageURL = profileImageURL
    }

        // Example method (you can add more):
    func greet() -> String {
        return "Hello, my name is \(name)!"
    }

        // Example method to check if the user is an adult:
    func isAdult() -> Bool {
        return age >= 18
    }

        // Example method to format the user's address:
    func formattedAddress() -> String {
        return "\(name)\n\(address)\n\(email)"
    }

}



    // MARK: - View Models

class UsersViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let userService: UserServiceProtocol
    @Published var users: [User] = []

    init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    func fetchUsers() {
        userService.getUsers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion: Subscribers.Completion<Error>) in
                    // Handle completion if needed
            }, receiveValue: { [weak self] (users: [User]) in
                self?.users = users
            }).store(in: &cancellables)
    }
}

    // MARK: - Views

struct UserListView: View {
    @StateObject var viewModel = UsersViewModel(userService: UserService())

    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}
