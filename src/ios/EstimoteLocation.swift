@objc(EstimoteLocation) class EstimoteLocation : CDVPlugin {
    @objc(echo:) func echo(command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )
        
        let msg = command.arguments[0] as? String ?? ""
        
        if msg.characters.count > 0 {
            /* UIAlertController is iOS 8 or newer only. */
            let toastController: UIAlertController =
                UIAlertController(
                    title: "",
                    message: msg,
                    preferredStyle: .alert
            )
            
            self.viewController?.present(
                toastController,
                animated: true,
                completion: nil
            )


            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: msg
            )
        }

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }

    @objc(indoor:) func indoor(command: CDVInvokedUrlCommand){

        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

        let creds = command.arguments[0] as! Dictionary<String,String>

        let locationView = LocationViewController()
        /* UIAlertController is iOS 8 or newer only. */
        locationView.setEstimoteCredentials(appId: creds["appId"]!, appToken: creds["appToken"]!, locationId: creds["locationId"]!)


        self.viewController?.present(
            locationView,
            animated: true,
            completion: nil
        )


        pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK
        )


        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }
}
