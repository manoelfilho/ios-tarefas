//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Manoel Filho on 24/04/21.
//

import SwiftUI

struct NewTaskItemView: View {
    
    //MARK: - Property
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State private var task:String = ""
    
    @Binding var isShowing: Bool
    
    //exemplo de computer property
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    var body: some View {
        VStack{
            Spacer()
            //campo de text e botao
            VStack(spacing: 16){
                
                TextField("Nova tarefa", text: $task)
                    .foregroundColor(Color.green)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button(
                    action: {
                        addItem()
                        //playSound(sound: "sound-ding", type: "mp3")
                        feedback.notificationOccurred(.success)
                    },
                    label: {
                        Spacer()
                        Text("ADICIONAR")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                    }
                )
                .disabled(isButtonDisabled)
                .padding()
                .foregroundColor(Color.white)
                .background( isButtonDisabled ? Color.blue : Color.green)
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(
                color: Color(
                    red: 0,
                    green: 0,
                    blue: 0,
                    opacity: 0.3
                ),
                radius: 12
            )
            .frame(maxWidth: 640)
            .padding()
        }
    }
    
    //MARK: - Functions
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyBoard()
            isShowing = false
        }
    }
    
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
