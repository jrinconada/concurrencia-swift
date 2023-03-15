//
//  ContentView.swift
//  Concurrencia
//
//  Created by Alumnos on 15/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var mensaje = "Espera 3 segundos"
    var body: some View {
        Button(mensaje) {
            semaforo()
            mensaje = "Cargando..."
            Task {
                await wait(seconds: 3)
                mensaje = "Dale otra vez"
            }
        }
    }
    
    func esperar(segundos: Double, fin: @escaping () -> ()) {
        print("inicio")
        // Ejecutar en hilo secundario
        DispatchQueue.global(qos: .background).async {
            Thread.sleep(forTimeInterval: segundos)
            print("fin")
            // Ejecutar en hilo principal
            DispatchQueue.main.async {
                fin()
            }
        }
    }
    
    func wait(seconds: Double) async {
        DispatchQueue.global(qos: .background).async {
            Thread.sleep(forTimeInterval: seconds)
        }
    }
    
    func semaforo() {
        let semaforo = DispatchSemaphore(value: 3)
        for i in 0..<10 {
            DispatchQueue.global().async {
                print("Elemento \(i) esperando...")
                semaforo.wait()
                print("Elemento \(i) consumiendo recurso...")
                sleep(5)
                semaforo.signal()
                print("Elemento \(i) terminado.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
