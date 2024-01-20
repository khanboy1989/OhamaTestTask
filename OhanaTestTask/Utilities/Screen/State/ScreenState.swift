//
//  ScreenState.swift
//  OhanaTestTask
//
//  Created by Serhan Khan on 20/01/2024.
//

import Foundation
//ScreenState is used in order to update the screen
//for each request
enum ScreenState<T> {
    case loading
    case error(error: String)
    case noData
    case succes(data: T)
    case finished
}
