//
//  Home.swift
//  UI-329 (iOS)
//
//  Created by nyannyan0328 on 2021/10/13.
//

import SwiftUI


struct Home: View {
    @State var showPicker : Bool = false
    @State var graphiceScale : Bool = false
    @State var placement : Placement = .leading
    @State var show : Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.init(Color.red.opacity(0.3))]
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font:UIFont(name: "Georgia-Bold", size: 30)!]
    
    }
    var body: some View {
        NavigationView{
            
            List{
                
                Toggle(isOn: $showPicker) {
                    
                    Text("Show Picker")
                    
                }
                
                Toggle(isOn: $graphiceScale) {
                    
                    Text("Graphicale Data Picker")
                }
                
                Button {
                    withAnimation(.spring()){
                        
                        placement = (placement == .leading ? .trailing : .leading)
                    }
                } label: {
                    
                    Text("Custom ToolBar Placement")
                        .font(.title3.weight(.thin))
                    
                }
                

                
                
                
            }
            .listStyle(.sidebar)
            .navigationBarTitle("Pop Up Over")
           
            .toolbar {
                
                
                ToolbarItem(placement: placement == .leading ? .navigationBarLeading : .navigationBarTrailing) {
                    
                    
                    Button {
                        
                        withAnimation{
                            
                            show.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "slider.horizontal.below.square.fill.and.square")
                    }

                    
                    
                    
                }
                
            }
            
           
        }
        .ToolBarPopOver(show: $show, placement: placement) {
            
            
            if showPicker{
                
                Picker(selection: .constant("")) {
                    
                    
                    ForEach(1...20,id:\.self){index in
                        
                        Text("Jacob Degrom\(index)")
                    }
                    
                    
                } label: {
                    
                }
                .pickerStyle(.wheel)
                .labelsHidden()

                
            }
            
            else if graphiceScale{
                
                DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                
            }
            else{
                
                DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(.compact)
                    .labelsHidden()
            }
            
            
            
            
            
        }
        
      
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
enum Placement{
    
    case leading
    case trailing
}
