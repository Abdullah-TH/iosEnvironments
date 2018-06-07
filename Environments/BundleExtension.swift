//
//  BundleExtension.swift
//  Environments
//
//  Created by Abdullah Althobetey on 08/06/2018.
//  Copyright © 2018 Abdullah Althobetey. All rights reserved.
//

import Foundation

extension Bundle
{
    var labelValue: String {
        let value = object(forInfoDictionaryKey: "LabelValue") as? String
        return value ?? ""
    }
}
