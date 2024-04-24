import FirebaseAuth
import FirebaseFirestore
import Foundation

struct User {
    var id: String
    var name: String
    var email: String
}

class ProfileViewViewModel: ObservableObject {
    @Published var user: User?

    init() {
        fetchUser()
    }

    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? ""
                )
            }
        }
    }

    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}


