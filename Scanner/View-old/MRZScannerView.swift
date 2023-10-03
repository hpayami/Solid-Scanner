//import SwiftUI
//import UIKit
//import AVFoundation
//import MRZScanner
//
//struct MRZScannerView: View {
//    @State private var scanningIsEnabled = true
//    @State private var regionOfInterest = CGRect(x: 0, y: 0, width: 1, height: 1)
//    @State private var textOrientation = CGImagePropertyOrientation.up
//    @State private var currentOrientation = UIDeviceOrientation.portrait // Declare currentOrientation here
//
//    let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        return formatter
//    }()
//
//    @State private var captureDevice: AVCaptureDevice?
//    @State private var bufferAspectRatio: Double!
//    @State private var uiRotationTransform = CGAffineTransform.identity
//    @State private var bottomToTopTransform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -1)
//    @State private var roiToGlobalTransform = CGAffineTransform.identity
//    @State private var visionToAVFTransform = CGAffineTransform.identity
//
//    @State private var boxLayer = [CAShapeLayer]()
//
//    @State private var scannedResult: ParsedResult?
//    @State private var isAlertPresented = false
//    @State private var errorMessage = ""
//
//    var body: some View {
//        ZStack {
//            PreviewView()
//                .onAppear {
//                    setup()
//                    checkCaptureDeviceAuthorization()
//                    setupCamera()
//                    calculateRegionOfInterest()
//                }
//                .onDisappear {
//                        // Capture session cleanup if needed
//                }
//                .onRotate { newOrientation in
//                    currentOrientation = newOrientation
//                    calculateRegionOfInterest()
//                }
//                .overlay(
//                    RoundedRectangle(cornerRadius: 0)
//                        .stroke(Color.red, lineWidth: 2)
//                        .opacity(0.5)
//                        .background(
//                            RoundedRectangle(cornerRadius: 0)
//                                .stroke(Color.green, lineWidth: 2)
//                                .opacity(0.5)
//                        )
//                )
//        }
//        .alert(isPresented: $isAlertPresented) {
//            Alert(title: Text("MRZ Scanned"), message: Text(errorMessage), dismissButton: .default(Text("OK")) {
//                scanningIsEnabled = true
//            })
//        }
//    }
//
//    private func setup() {
//            // Setup code for your view
//    }
//
//    private func calculateRegionOfInterest() {
//            // Calculate region of interest
//    }
//
//    private func setupCamera() {
//            // Setup camera and AVCaptureSession
//    }
//
//    private func showBoundingRects(valid validRects: [CGRect], invalid invalidRects: [CGRect]) {
//            // Show bounding rectangles on the preview
//    }
//
//    private func draw(rect: CGRect, color: Color) {
//            // Draw bounding rectangles
//    }
//
//    private func removeBoxes() {
//            // Remove bounding rectangles
//    }
//
//    private func displayError(_ error: Error) {
//            // Display error message
//    }
//
//    private func displayScanningResult(_ result: ParsedResult) {
//            // Display scanning result
//    }
//
//    private func addAlertActionAndPresent(_ message: String) {
//        errorMessage = message
//        isAlertPresented = true
//    }
//
//    private func checkCaptureDeviceAuthorization() {
//            // Check camera authorization status and request access
//    }
//
//    private func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//            // Handle AVCapture video output here
//    }
//}
//
//struct MRZScannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MRZScannerView()
//    }
//}
//
//
//
//    // Define a UIViewRepresentable for the PreviewView
//struct PreviewViewRepresentable: UIViewRepresentable {
//    typealias UIViewType = PreviewView
//
//    func makeUIView(context: Context) -> PreviewView {
//        let previewView = PreviewView()
//            // Additional setup for your UIView if needed
//        return previewView
//    }
//
//    func updateUIView(_ uiView: PreviewView, context: Context) {
//            // Update the UIView if needed
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//        // Coordinator class for managing interactions
//    class Coordinator: NSObject {
//        var parent: PreviewViewRepresentable
//
//        init(_ parent: PreviewViewRepresentable) {
//            self.parent = parent
//            super.init()
//
//                // Perform any additional coordinator setup if needed
//        }
//
//            // Implement the onAppear function to perform actions when the UIView appears
//        func onAppear() {
//                // This is where you can perform actions when the UIView appears
//    
//        }
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        PreviewViewRepresentable()
//    }
//}
//
//    // UIKit-based PreviewView
//class PreviewView: UIView {
//    override func didMoveToWindow() {
//        super.didMoveToWindow()
//            // Perform actions when the UIView appears
//        if window != nil {
//            onAppear()
//        }
//    }
//
//    func onAppear() {
//            // This is where you can perform actions when the UIView appears
//    }
//}
