//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Sergio Ordaz Romero on 14/08/22.
//

import SwiftUI

struct DetailView: View {
    @State private var data = DailyScrum.Data()
    @Binding var scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Información de la Meet")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Iniciar Meet", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Longitud", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutos")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Tema", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Participantes")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section(header: Text("Historial")) {
                if scrum.history.isEmpty {
                    Label("No hay meets por ahora", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Editar") {
                isPresentingEditView = true
                data = scrum.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancelar") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Aceptar") {
                                isPresentingEditView = false
                                scrum.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var scrum: [DailyScrum] = DailyScrum.sampleData
    
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
