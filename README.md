# EsimoteLocation
Cordova plugin for Estimote Indoor Location SDK

## Usage

### Install the plugin

`cordova plugin add https://github.com/assyme/EsimoteLocation.git`

### Build / Prepare your app

`cordova prepare`

### Setup in case build fails
Go to "Build Settings", find "Other Linker Flags" and add -lc++. Additionally, set Enable Bitcode to NO

### Using it in your project

`EstimoteLocation.indoor({
    appId: "YOUR_APP_ID",
    appToken: "YOUR_APP_TOKEN",
    locationID: "LOCATION_ID"
})`

All the above information can be found in your estimote cloud account


### work still in progress
