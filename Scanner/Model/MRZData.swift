//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import Foundation
struct MRZData {
    let documentType: String
    let countryCode: String
    let documentNumber: String
    let optionalData: String?
    let lastName: String
    let firstName: String
    let nationality: String
    let birthdate: String
    let sex: String
    let expiryDate: String

    init(documentType: String, countryCode: String, documentNumber: String, optionalData: String?, lastName: String, firstName: String, nationality: String, birthdate: String, sex: String, expiryDate: String) {
        self.documentType = documentType
        self.countryCode = countryCode
        self.documentNumber = documentNumber
        self.optionalData = optionalData
        self.lastName = lastName
        self.firstName = firstName
        self.nationality = nationality
        self.birthdate = birthdate
        self.sex = sex
        self.expiryDate = expiryDate
    }
        // Method to generate a formatted MRZ string
    func formattedMRZString() -> String {
        let documentTypeAndCountryCode = documentType + countryCode
        let documentNumberAndOptionalData = documentNumber + (optionalData ?? "")
        let birthdateAndSexAndExpiryDate = birthdate + sex + expiryDate

        return documentTypeAndCountryCode + documentNumberAndOptionalData + lastName + firstName + nationality + birthdateAndSexAndExpiryDate
    }
}
