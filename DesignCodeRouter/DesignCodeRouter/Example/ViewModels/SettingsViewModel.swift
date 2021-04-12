//
//  SettingsViewModel.swift
//  DesignCodeRouter
//
//  Created by Olga Shilenko on 12.04.2021.
//

import Foundation
import SwiftUI

final class SettingsViewModel: ObservableObject {
    var presentationMode: PresentationMode = .push
    var modalPresentationStyle: ModalPresentationStyle = .pageSheet
    var modalTransitionStyle: ModalTransitionStyle = .coverVertical
    
    var presentationStyle: PresentationStyle {
        switch presentationMode {
        case .push:
            return .push
            
        case .present:
            return .present(presentationStyle: modalPresentationStyle.uiModalPresentationStyle,
                            transitionStyle: modalTransitionStyle)
        }
    }
}

extension SettingsViewModel {
    typealias ModalTransitionStyle = UIModalTransitionStyle
    
    enum PresentationMode: Int, CaseIterable, Identifiable {
        case push
        case present
        
        public var id: Int { return rawValue }
        
        var description: String {
            switch self {
            case .push:
                return "push"
                
            case .present:
                return "present"
            }
        }
    }
    
    enum ModalPresentationStyle: Int, CaseIterable, Identifiable {
        case pageSheet
        case overFullScreen
        
        public var id: Int { return rawValue }
        
        var description: String {
            switch self {
            case .pageSheet:
                return "pageSheet"
                
            case .overFullScreen:
                return "overFullScreen"
            }
        }
        
        var uiModalPresentationStyle: UIModalPresentationStyle {
            switch self {
            case .overFullScreen:
                return .overFullScreen
                
            case .pageSheet:
                return .pageSheet
            }
        }
    }
}

extension UIModalTransitionStyle: CaseIterable, Identifiable {
    public var id: Int { return rawValue }
    
    public typealias AllCases = [UIModalTransitionStyle]
    
    public static var allCases: [UIModalTransitionStyle] {
        return [.coverVertical, .crossDissolve, .flipHorizontal, .partialCurl]
    }
    
    var description: String {
        switch self {
        case .coverVertical:
            return "vertical"
            
        case .crossDissolve:
            return "cross"
            
        case .flipHorizontal:
            return "horizontal"
            
        case .partialCurl:
            return "curl"
            
        @unknown default:
            fatalError()
        }
    }
}
