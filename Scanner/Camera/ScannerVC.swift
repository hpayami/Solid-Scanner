    //
    // Copyright © 1402 AP Hossein Payami. All rights reserved.
    //


import UIKit
import AVFoundation

enum CameraError {
    case invalidDeviceInput
    case invalidScannedValue
}


protocol ScannerVCDelegate : AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
    func didToggleTorch(isOn: Bool)
}
final class ScannerVC: UIViewController {

    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDelegate?
    var scannerView: ScannerView?




    init(scannerDelegate: ScannerVCDelegate){
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let previewLayer = previewLayer else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }

        previewLayer.frame = view.layer.bounds
    }
        //    private func setupCaptureSession(){
        //        guard let videoCapureDevice = AVCaptureDevice.default(for: .video) else {
        //            scannerDelegate?.didSurface(error: .invalidDeviceInput)
        //            return
        //        }
        //        let videoInput: AVCaptureDeviceInput
        //        do {
        //            try videoInput = AVCaptureDeviceInput(device: videoCapureDevice)
        //        } catch{
        //            scannerDelegate?.didSurface(error: .invalidDeviceInput)
        //            return
        //        }
        //        if captureSession.canAddInput(videoInput){
        //            captureSession.addInput(videoInput)
        //        }else {
        //            scannerDelegate?.didSurface(error: .invalidDeviceInput)
        //            return
        //        }
        //        let metaDataOutput = AVCaptureMetadataOutput()
        //        if captureSession.canAddOutput(metaDataOutput){
        //            captureSession.addOutput(metaDataOutput)
        //            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        //            metaDataOutput.metadataObjectTypes = [ .aztec,.catBody,.codabar,.code128,.code39,.code39Mod43,.code93,.dataMatrix,.dogBody,.ean13,.ean8,.face,.gs1DataBar,.upce,.salientObject,.qr,.pdf417,.microQR,.microPDF417,.itf14,.interleaved2of5,.humanBody,.gs1DataBarLimited,.gs1DataBarExpanded]
        //        } else {
        //            scannerDelegate?.didSurface(error: .invalidDeviceInput)
        //            return
        //        }
        //
        //        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        //        previewLayer!.videoGravity = .resizeAspectFill
        //        view.layer.addSublayer(previewLayer!)
        //        captureSession.startRunning()
        //    }
    private func setupCaptureSession() {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
                self.scannerDelegate?.didSurface(error: .invalidDeviceInput)
                return
            }

            let videoInput: AVCaptureDeviceInput
            do {
                try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
            } catch {
                self.scannerDelegate?.didSurface(error: .invalidDeviceInput)
                return
            }

            if self.captureSession.canAddInput(videoInput) {
                self.captureSession.addInput(videoInput)
            } else {
                self.scannerDelegate?.didSurface(error: .invalidDeviceInput)
                return
            }

            let metaDataOutput = AVCaptureMetadataOutput()
            if self.captureSession.canAddOutput(metaDataOutput) {
                self.captureSession.addOutput(metaDataOutput)
                metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metaDataOutput.metadataObjectTypes = [
                    .aztec,.catBody,.codabar,.code128,.code39,.code39Mod43,.code93,.dataMatrix,.dogBody,.ean13,.ean8,.face,.gs1DataBar,.upce,.salientObject,.qr,.pdf417,.microQR,.microPDF417,.itf14,.interleaved2of5,.humanBody,.gs1DataBarLimited,.gs1DataBarExpanded
                ]
            } else {
                self.scannerDelegate?.didSurface(error: .invalidDeviceInput)
                return
            }

            self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            self.previewLayer!.videoGravity = .resizeAspectFill

            DispatchQueue.main.async {
                self.view.layer.addSublayer(self.previewLayer!)
                self.captureSession.startRunning()
            }
        }



    }
    func toggleTorch() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = device.torchMode == .off ? .on : .off
                device.unlockForConfiguration()
                scannerDelegate?.didToggleTorch(isOn: device.torchMode == .on)
            } catch {
                print("Error toggling torch: \(error.localizedDescription)")
            }
        }
    }

}

extension ScannerVC : AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return }

        guard let barcode  = machineReadableObject.stringValue else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        scannerDelegate?.didFind(barcode: barcode)

    }
}
