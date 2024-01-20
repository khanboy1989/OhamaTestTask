//
//  AppUsageViewModel.swift
//  OhanaTestTask
//
//  Created by Serhan Khan on 20/01/2024.
//

import Foundation
import Combine

final class AppUsageViewModel {
    var viewState = PassthroughSubject<ScreenState<[AppUsageViewModel.TableViewSection]>, Never>()
    
    enum TableViewSection: Hashable {
        case byApp(items: [ByApp])
        case byCategories(items: [ByCategory])
        
        var title: String {
            switch self {
            case .byApp:
                return "By App"
            case .byCategories:
                return "By Categories"
            }
        }
    }

    func fetchAppUsages() {
        viewState.send(.loading)
        
        // To simulate loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self else {
                self?.viewState.send(.error(error: "Loading Error"))
                return
            }
            
            let category = self.byCategory()
            let app = self.byApp()
            self.createSections(byApp: app, byCategory: category)
        }
        
    }

    private func byCategory() -> [ByCategory] {
        return [
            ByCategory(type: .socials, percentage: 52.0 , duration: "08:12", count: 14),
            ByCategory(type: .games, percentage: 21.0 , duration: "02:27", count: 11),
            ByCategory(type: .education, percentage: 13.0, duration: "01:08", count: 4),
            ByCategory(type: .productivity, percentage: 8.0, duration: "00:39", count: 2),
            ByCategory(type: .messaging, percentage: 0, duration: "", count: 1)
        ]
    }
    
    private func byApp() -> [ByApp] {
        return [
            ByApp(name: "Instagram", icon: "instagram", duration: "8h 12m"),
            ByApp(name: "Tiktok", icon: "tiktok", duration: "2h 27m"),
            ByApp(name: "Minecraft", icon: "minecraft", duration: "1h 21m"),
            ByApp(name: "Roblox", icon: "roblox", duration: "32m"),
            ByApp(name: "Youtube", icon: "youtube", duration: "17m")
            
        ]
    }
    
    private func createSections(byApp: [ByApp], byCategory: [ByCategory]) {
        var sections: [AppUsageViewModel.TableViewSection] = []
        sections.append(.byCategories(items: byCategory))
        sections.append(.byApp(items: byApp))
        viewState.send(.succes(data: sections))
    }
}
