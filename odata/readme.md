OData
=====

# Dependencies
- Install the nuget package.
	> Install-Package Microsoft.AspNet.Odata.
- Configure the OData route (WebApiConfig).
	> var builder = new ODataModelBuilder();  
	> builder.EntitySet<Flight>("Flights").EntityType.HasKey(i => i.FlightId);  
	> config.MapODataServiceRoute("ODataRoute", "odata", builder.GetEdmModel());
- The controller should inherit ODataController.
- The methods should be decorated with the EnableQuery attribute for security reasons.

## Urls
- http://.../$metadata
- http://.../$metadata#Flights