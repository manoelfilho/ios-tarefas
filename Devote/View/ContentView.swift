//
//  ContentView.swift
//  Devote
//
//  Created by Manoel Filho on 17/04/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    //MARK: - Property
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State var task: String = ""
    @State private var showNewTaskItem: Bool = false
    
    //MARK: - Fetching data
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default
    )
    private var items: FetchedResults<Item>

    var body: some View {
        
        NavigationView {
            
            ZStack {
            
                //MARK: - MAIN VIEW
                VStack {
                    
                    //MARK: - HEADER
                    HStack(spacing: 10){
                        
                        //MARK: - TITLE
                        Text("Tarefas")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading, 4)
                        
                        Spacer()
                        
                        //MARK: - TITLE BUTTON
                        EditButton()
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth: 70, minHeight: 24)
                            .background(Capsule().stroke(Color.white, lineWidth: 2))
                        
                        //MARK: - APPEARANCE
                        Button(action: {
                            //MARK: - TOGGLE THE APPEARANCE
                            isDarkMode.toggle()
                            //playSound(sound: "sound-tap", type: "mp3")
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Image(systemName: isDarkMode ? "moon.fill" : "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .font(.system(.title, design: .rounded))
                        })
                        
                        //MARK: - HSTACK
                    }//: HStack
                    .padding()
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 60)
                    
                    //MARK: - NEW TASK BUTTON
                    Button(action: {
                        showNewTaskItem = true
                        feedback.notificationOccurred(.success)
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        Text("NOVA")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green, Color.blue]),
                            startPoint: .leading, endPoint: .trailing
                        ).clipShape(Capsule())
                    )
                    .shadow(
                        color: Color(
                            red: 0,
                            green: 0,
                            blue: 0,
                            opacity: 0.25
                        ),
                        radius: 8, x: 0, y: 4.0
                    )
                    
                    //MARK: - TASKS
                    List {
                        ForEach(items) { item in
                            
                            ListRowItemView(item: item)
                            
                        }
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                        
                    }//:LIST
                    
                    .listStyle(InsetGroupedListStyle())
                    .shadow(
                        color: Color(
                            red: 0,
                            green: 0,
                            blue: 0,
                            opacity: 0.3
                        ),
                        radius: 12
                    )
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                
                }//:VSTACK
                
                .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5))
                
                //MARK: - NEW TASK ITEM
                
                //BlankView()
                //NewTaskItemView()
                if showNewTaskItem {
                    BlankView(
                        backgroundColor: isDarkMode ? Color.black : Color.gray,
                        backgroundOpactity: isDarkMode ? 0.3 : 0.5
                    )
                    .onTapGesture {
                        withAnimation(){
                            showNewTaskItem = false
                        }
                    }
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
            
            }//:ZTACK
            
            // removendo o background do zstack
            .onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            
            .navigationBarTitle("Tarefas", displayMode: .large)
            .navigationBarHidden(true)
            
            
            .background(
                BackgroundImageView()
                    .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
            )
            
            .background(
                backgroundGradient.ignoresSafeArea()
            )
                
        }//:NAVIGATION VIEW
        .navigationViewStyle(StackNavigationViewStyle()) //PARA O IPAD
        
    }

    //MARK: - Functions

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func moveItems(from: IndexSet, to: Int){
        withAnimation{
            print("Aqui")
            print(from)
            print(to)
        }
    }
}


//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
