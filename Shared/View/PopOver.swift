//
//  PopOver.swift
//  UI-329 (iOS)
//
//  Created by nyannyan0328 on 2021/10/13.
//

import SwiftUI

extension View{
    
    func ToolBarPopOver<Content : View>(show : Binding<Bool>,placement : Placement = .leading,@ViewBuilder content : @escaping()->Content)->some View{
        
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           
            .overlay(
            
                ZStack(alignment: placement == .leading ? .topLeading : .topTrailing, content: {
                    
                    
                    if show.wrappedValue{
                        
                        Rectangle()
                            .fill(Color.black.opacity(0.03))
                            .onTapGesture {
                                
                                withAnimation{
                                    
                                    show.wrappedValue.toggle()
                                }
                                
                                
                            }
                        
                        content()
                            .padding()
                            .background(Color.white.clipShape(PopupCsutomShape(placement: placement)))
                            .shadow(color: .primary.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: .primary.opacity(0.1), radius: 5, x: -5, y: -5)
                            .padding(.horizontal,40)
                            .offset(y: 55)
                            .offset(x: placement == .leading ? -22 : 22)
                           
                            
                    }
                    
                  
                
                    
                    
                })
                
            
            
            )
        
        
        
        
    }
    
}

struct PopOver_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PopupCsutomShape : Shape{
    
    var placement : Placement
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            
            let pt1 = CGPoint(x: 0, y: 0)
            let pt2 = CGPoint(x: rect.width, y: 0)
            let pt3 = CGPoint(x: rect.width, y: rect.height)
            let pt4 = CGPoint(x: 0, y: rect.height)
            
            path.move(to: pt4)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 20)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 20)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 20)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 20)
            
            
            path.move(to: pt1)
            
            path.addLine(to: CGPoint(x: placement == .leading ? 10 : rect.width - 10, y: 0))
            path.addLine(to: CGPoint(x: placement == .leading ? 20 : rect.width - 20, y: 0))
            path.addLine(to: CGPoint(x: placement == .leading ? 30 : rect.width - 28, y: -20))
            path.addLine(to: CGPoint(x: placement == .leading ? 40 : rect.width - 35, y: 0))
            
            
            
        
        }
    }
}
