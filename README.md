# Concurrencia con *Swift*
## Casos de uso
- **Conexiones**: descargas, subidas, peticiones web...
- **Procesamientos costosos**: imagen, vídeo, 3D, cálculos...
- **Eventos programados**: alarmas, copias de seguridad...
- **Recursos compartidos**: sistema operativo, servidor, computación distribuida...

## Conceptos importantes:
- Concurrencia (*paralelo* VS *serie*)
- Distribuido (*centralizado* VS *centralizado* VS *distribuido*)
- Proceso (*OS process*)
- Hilo (*Thread*)
- Sincronización (*sync* / *async*)
- Prioridad (*Quality of Service*)

## Problemas
### Productores y Consumidores
### Lectores y Escritores
### Filósofos comilones

Palabras clave en *Swift*:
## Cola
- `DispatchQueue`
## Tarea
- `Task` `async` `await`

## Semáforo
```swift
let concurrentes = 3
let semaphore = DispatchSemaphore(value: concurrentes)
for i in 0..<10 {
  DispatchQueue.global().async {
    let number = i + 1
    semaphore.wait()
    print("Trabajando en", number)
    sleep(2)
    print(number, "finalizado")
    semaphore.signal()
  }
}
```
