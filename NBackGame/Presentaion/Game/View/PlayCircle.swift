//
//  PlayCircle.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/10/2021.
//

import SwiftUI

struct PlayCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: Angle.zero, endAngle: Angle(radians: .pi * 2), clockwise: true)
        
        return path
    }
}
