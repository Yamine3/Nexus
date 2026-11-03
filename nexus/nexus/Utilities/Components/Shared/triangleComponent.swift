//
//  triangleComponent.swift
//  testNexusProject
//
//  Created by apprenant92 on 30/10/2026.
//

import Foundation
import SwiftUI

struct triangleComponents: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(
                x: 0,
                y: 0
            ))
            path.addLine(to: CGPoint(
                x: rect.width,
                y: 0
            ))
            path.addLine(to: CGPoint(
                x: rect.width,
                y: rect.height * 0.25
            ))
            path.addLine(to: CGPoint(
                x: rect.width * 0.65,
                y: rect.height
            ))
            path.closeSubpath()
        }
    }
}


#Preview {
    triangleComponents()
}
