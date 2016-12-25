# EsimoteLocation
Cordova plugin for Estimote Indoor Location SDK

## Usage

### Install the plugin

`cordova plugin add https://github.com/assyme/EsimoteLocation.git`

### Build / Prepare your app

`cordova prepare`

### Setup in case build fails
Go to "Build Settings", find "Other Linker Flags" and add -lc++. Additionally, set Enable Bitcode to NO

Moreover, if you still see some linking errors, go to "Build Phases", "Link Binary With Libraries" find the framework libEstimoteIndoorSDK.a and just move it around (up or down the list of the libraries)
Not sure why or how this fixes it, but it does most of the times.


### Using it in your project

`EstimoteLocation.indoor({
    appId: "YOUR_APP_ID",
    appToken: "YOUR_APP_TOKEN",
    locationID: "LOCATION_ID"
})`

All the above information can be found in your estimote cloud account


### work still in progress
