//
//  ContentView.swift
//  MaterialDesignTextFieldExample
//
//  Created by Nikita Lazarev-Zubov on 22.5.2022.
//

import MaterialDesignTextField
import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    // MARK: View protocol properties

    var body: some View {
        VStack {
            MaterialDesignTextField(
                $viewModel.text1,
                placeholder: viewModel.placeholder1,
                hint: $viewModel.hint1,
                editing: $editingTextField1,
                valid: $viewModel.text1Valid
            )
                .padding()
                .onTapGesture { editingTextField1 = true }
            MaterialDesignTextField(
                $viewModel.text2,
                placeholder: viewModel.placeholder2,
                hint: $viewModel.hint2,
                editing: $editingTextField2,
                valid: $viewModel.text2Valid
            )
                .padding()
                .onTapGesture { editingTextField2 = true }
            Spacer()
        }
            .contentShape(Rectangle())
            .onTapGesture {
                editingTextField1 = false
                editingTextField2 = false
            }
    }

    // MARK: Private properties

    @State
    private var editingTextField1 = false {
        didSet {
            guard editingTextField1 != oldValue else {
                return
            }
            if editingTextField1 {
                editingTextField2 = false
            } else {
                viewModel.validateText1()
            }
        }
    }
    @State
    private var editingTextField2 = false {
        didSet {
            guard editingTextField2 != oldValue else {
                return
            }
            if editingTextField2 {
                editingTextField1 = false
            } else {
                viewModel.validateText2()
            }
        }
    }
    @StateObject
    private var viewModel = ContentViewModel()

}

#if DEBUG

#Preview {
    ContentView()
}

#endif
