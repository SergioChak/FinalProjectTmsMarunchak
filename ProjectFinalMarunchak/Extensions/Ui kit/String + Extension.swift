//
//  String + Externsion.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//


import Foundation
import FileProvider

extension String{
    
    enum ValidTypes{
        case name
        case email
        case password
        case phone
    }
    
    enum Regex: String{
        case name = "[a-zA-Z]{1,}" // регулярное выражение для проверки символов!!
        case email = "[a-zA-Z0-9._]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}" // чтобы проверить и символ собачки и точку после нее. в конце мы ограничиваем минимальное количество символов после точки. чтобы было например @mail.ru хотя бы а не @mail.r
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
        case phone = "[0-9]{12,}"
    }
    
    func isValid(validType: ValidTypes) -> Bool{
        let format = "SELF MATCHES %@"
        var regex  = ""
        
        switch validType {
        case .name: regex = Regex.name.rawValue
        case .email: regex = Regex.email.rawValue
        case .password: regex = Regex.password.rawValue
        case .phone: regex = Regex.phone.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
    
    
}
