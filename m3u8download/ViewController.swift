//
//  ViewController.swift
//  m3u8download
//
//  Created by Deep Arora on 7/26/18.
//  Copyright © 2018 Deep Arora. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAssetDownloadDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAssetDownload()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setupAssetDownload() {
        // Create new background session configuration.
        let configuration = URLSessionConfiguration.background(withIdentifier: "AssetID")
        
        // Create a new AVAssetDownloadURLSession with background configuration, delegate, and queue
        let downloadSession = AVAssetDownloadURLSession(configuration: configuration,
                                                        assetDownloadDelegate: self,
                                                        delegateQueue: OperationQueue.main)
        
        let url = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")
        // let url = URL(string: "https://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8")
        let asset = AVURLAsset(url: url!)
        
        // Create new AVAssetDownloadTask for the desired asset
        let downloadTask = downloadSession.makeAssetDownloadTask(asset: asset,
                                                                 assetTitle: "AssetTitle",
                                                                 assetArtworkData: nil,
                                                                 options: nil)
        // Start task and begin download
        downloadTask?.resume()
    }
    
    //MARK: Delegates
    public func urlSession(_ session: URLSession, assetDownloadTask: AVAssetDownloadTask, didFinishDownloadingTo location: URL){
        print("DownloadedLocation:\(location.absoluteString)")
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("Error")
    }
    
    public func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        print("Error")
    }
    
    public func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
        print("Waiting")
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        print("Finihs collecting metrics:")
    }
}

