//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Sergio Ordaz Romero on 14/08/22.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView: Bool = false
    @State var newScrumData: DailyScrum.Data = DailyScrum.Data()
    
    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink (destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Scrums del día")
        .toolbar {
            Button(action: { isPresentingNewScrumView.toggle() }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("Nuevo scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancelar") {
                                isPresentingNewScrumView.toggle()
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Agregar") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView.toggle()
                                newScrumData = DailyScrum.Data()
                            }
                        }
                }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}
