//
//  FontRegister.swift
//  DesignSystem
//
//  Created by 상은 on 6/17/25.
//

import UIKit
import CoreText

public enum Pretendard {
    public static func registerFont() {
        guard let fontURLs = Bundle.module.urls(forResourcesWithExtension: "ttf", subdirectory: nil) else {
            print("❌ Font files not found in module bundle")
            return
        }

        for url in fontURLs {
            var error: Unmanaged<CFError>?
            let success = CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
            if !success {
                print("❌ Failed to register font: \(url.lastPathComponent)")
            } else {
                print("✅ Registered font: \(url.lastPathComponent)")
            }
        }
    }
}
