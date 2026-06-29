
import SwiftUI


struct AlertItem : Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton : Alert.Button
}

struct Alertcontext{
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input", message: "Something went wrong with the camera", dismissButton: .default(Text("OK")))
    static let invalidScannedtype = AlertItem(title: "Invalid Scanner Input", message: "The value scanned is not a valid barcode. The app scans only EAN-8 & EAN-13 barcodes", dismissButton: .default(Text("OK")))
}
