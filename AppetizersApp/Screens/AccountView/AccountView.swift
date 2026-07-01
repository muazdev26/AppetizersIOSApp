//
//  AccountsView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 18/08/2025.
//

import SwiftUI

struct AccountView: View {

    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?

    enum FormTextField {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused(
                            $focusedTextField,
                            equals: FormTextField.firstName
                        )
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)

                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused(
                            $focusedTextField,
                            equals: FormTextField.lastName
                        )
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)

                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: FormTextField.email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.birthdate,
                        in: Date().oneHundredYearsAgo...Date().eighteenYearsAgo,
                        displayedComponents: .date
                    )
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }

                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle(
                        "Frequent Refills",
                        isOn: $viewModel.user.frequentRefills
                    )
                }.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .onAppear(perform: viewModel.loadUserData)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
            .navigationTitle("🧑🏻‍💻 Account")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: Text(alertItem.title),
                    message: Text(alertItem.message),
                    dismissButton: .default(Text(alertItem.buttonTitle))
                )
            }
        }
    }
}

#Preview {
    AccountView()
}
