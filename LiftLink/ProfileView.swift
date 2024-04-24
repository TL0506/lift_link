import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width:125, height:125)
                        .padding()
                    
                    // Info
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Name: ")
                                .bold()
                                .padding()
                            Text(user.name)
                        }
                        HStack{
                            Text("Email: ")
                                .bold()
                                .padding()
                            Text(user.email)
                        }
                    }
                    .padding()
                    
                    // Sign out
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    
                    Spacer()
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile") // Move navigationTitle modifier here
            .onAppear() {
                viewModel.fetchUser()
            }
        }
    }
}
