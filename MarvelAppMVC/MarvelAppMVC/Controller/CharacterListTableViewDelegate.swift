//
//  CharacterListTableViewDelegate.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 8/06/24.
//

import Foundation
import UIKit

final class CharacterListTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
