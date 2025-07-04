//
//  ContentViewModel.swift
//  MaterialDesignTextFieldExample
//
//  Created by Nikita Lazarev-Zubov on 22.5.2022.
//

import Combine

final class ContentViewModel: ObservableObject {

    // MARK: - Properties

    let placeholder1 = "Placeholder 1"
    let placeholder2 = "Placeholder 2"
    @Published
    var hint1 = "Hint 1"
    @Published
    var hint2 = "Hint 2"
    @Published
    var text1 = ""
    @Published
    var text2 = ""
    @Published
    var text1Valid = true {
        didSet {
            hint1 = text1Valid
                ? "Hint 1"
                : "Error 1"
        }
    }
    @Published
    var text2Valid = true {
        didSet {
            hint2 = text2Valid
                ? "Hint 2"
                : "Error 2"
        }
    }

    // MARK: - Methods

    func validateText1() {
        text1Valid.toggle()
    }

    func validateText2() {
        text2Valid.toggle()
    }

}
