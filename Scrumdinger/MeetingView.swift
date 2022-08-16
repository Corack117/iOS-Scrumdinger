//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Sergio Ordaz Romero on 14/08/22.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Tiempo transcurrido")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Tiempo faltante")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Tiempo restante")
            .accessibilityValue("10 minutos")
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack {
                Text("Hablante 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Siguiente hablante")
            }
        }
        .padding()
    }
}

struct MettingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
