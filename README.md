# Seats.aero iOS API client

This is a simple API client built in Swift that connects to the [Seats.aero](Seats.aero) API, which is documented on the [Seats.aero developers hub](https://developers.seats.aero/reference/).

This project is not affiliated with Seats.aero in any way.

## Usage

* This client is created as a Swift Package and can be added [via the package manager in Xcode](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).
* A pro account is required to obtain an API key, see the documentation for details. Also note that Pro accounts are limited to **non-commercial** use only.
* Accounts are limited to 1,000 API calls per day.
* All method names in this package are the same as the documented methods for the API.

## Example

The below example will return reward availability with United MileagePlus, departing from North America, in business class.


```
func sampleUse() async throws -> [Availability] {
    let seatsAeroAPI = SeatsAeroAPI(apiKey: "/* your API key */")
    let exploreResponse = try await seatsAeroAPI.bulkAvailability(source: .united, originRegion: .northAmerica, cabin: .business)
    return exploreResponse.availabilities
}
```

As no date range or destination region was provided, this would return trips on any date, departing from North America going to anywhere in the world.