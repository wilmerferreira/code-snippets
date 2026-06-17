# RESTful APIs

This is a guide with good practices for RESTful Web APIs

## Methods and Verbs

Each of the _CRUD_ operation uses a specific [Http Verb](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods)

| Operation | HttpVerb  | Comments                                         |
|-----------|-----------|--------------------------------------------------|
| Create    | `POST`    | Create one or many entities of a given type      |
| Read      | `GET`     | Return one or many entries from a given resource |
| Update    | `PUT`     | Replace one or more entries                      |
|           | `PATCH`   | Perform a partial update of one or more entries  |
| Delete    | `DELETE`  | Remove one or more entries from the system       |

## Uri

This section define the rules around the API's URLs (path and query strings)

### Path

- _Nouns_ SHOULD be in the **plural** form using `kebab-case`, with the following format `~/api/v:VERSION/:NOUN/`. e.g. `~/api/v1/published-pages/`
Some resources can have child elements, in this case it should follow as `~/api/v:VERSION/:NOUN/:id/:NOUN` whereas the second NOUN is the name of the children entity.
- SHOULD use an unique identifier (`GUID`, `string` or `int`), using the following format `~/api/v:VERSION/:NOUN/:ID`. e.g. `~/api/v1/published-pages/c037be00-c809-47c4-8f5c-d5a62f228ffa`.
- SHOULD contain a version to allow for API versioning. This version should be formatted as `~/api/v:VERSION/` where `VERSION` is an incrementing integer for every new API version. For example, `v1`, `v2`, `v3` etc.
- To help distinguish APIs from Gateways and other website URLs, all APIs could begin with ~/api/

Examples

| Resource                                | POST                                    | GET                                        | PUT / PATCH                                            | DELETE                             |
|-----------------------------------------|-----------------------------------------|--------------------------------------------|--------------------------------------------------------|------------------------------------|
| `~/api/:version/customers`              | Creates a new customer                  | Retrieves all/some customers               | Bulk full (or partial) updates customers               | Removes all customers              |
| `~/api/:version/customers/1`            | **Error**                               | Retrieves the details for customer `1`     | Updates the customer `1`                               | Removes customer `1`               |
| `~/api/:version/customers/1/orders`     | Creates a new order(s) for customer `1` | Retrieves all/some orders for customer `1` | Bulk full (or partial) updates orders for customer `1` | Remove all orders for customer `1` |
| `~/api/:version/customers/1/orders/123` | Error or create a new `123` order       | Retrieve the details for the order `123`ͣ   | Updates the order `123`                                 | Deletes order `123`                 |

ͣ  This can also be handled in a different endpoint `[GET] /orders/123`

### Query Strings

Use query parameters for filtering, sorting and paging

- Should be used to filter, sort or page a collection of resources.
- Should be listed after the Noun or Sub property, beginning with a ?
- Query Parameters should use `kebab-case` or `camelCase` to match the JSON property being filtered on

| Scenario   | Example                                                                      |
|------------|------------------------------------------------------------------------------|
| Filter	   | `?property1ToFilterOn=Value1ToFilterOn&property2ToFilterOn=Value2ToFilterOn` |
| Sorting	   | `?sort=+author,-datepublished`                                               |
| Pagination | `?limit=20`                                                                  |
|       	   | `?limit=20&offset=40`                                                        |

### Body

- Bodies could be used in `POST`, `PUT`, `PATCH` but NEVER be used in `GET` and `DELETE` operations
- Use `application/json` as default in the [`Accept`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Accept) header, but feel free to implement others like `application/xml`
- If the request has a body use `application/json` as default [`Content-Type`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Type)

### Responses

- Use `application/json` as default [`Content-Type`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Type) for responses if the request does not have the accept header
  - Endpoints that could return more than one result MUST return an array "[]", even if is only one element returned
  - If an Identifier is used (`/:id`) then the response should be a single JSON object `{}`.
- Respond with correct error http codes when required

#### Http Codes

##### Success

| Code                | Description                                                                                                | Scenario                                                                                                                                         |
|---------------------|------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| 200 OK              |	Standard response for successful HTTP requests                                                             | Fetch a record from the database                                                                                                                 |
| 201 Created         |	The request has been fulfilled, resulting in the creation of a new resource                                | Particularly used when a new resource is created (POST)                                                                                          |
| 202 Accepted        |	The request has been accepted for processing, but the processing has not been completed (async operations) | Creating and sending an email; Queuing a message in order to create something later                                                              |
| 204 No Content      |	The server successfully processed the request, and is not returning any content                            | Used when an endpoint performs an action but do not return any results, e.g. search without results (GET) or deletion from the database (DELETE) |
| 206 Partial Content |	The server is delivering only part of the resource                                                         | Used when an endpoint returns partial information from an entity, e.g. a search when the request can select the fields returned                  |

##### Errors

###### Client Errors

The request contains bad syntax or cannot be fulfilled (4xx client error)

| Code                     | Description                                                                                                                                                                             | Scenario                                                                                          |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| 400 Bad Request          | The server cannot or will not process the request due to an apparent client error ͣ                                                                                                      | Client-side input due to model validation                                                         |
| 401 Unauthorized         | Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.                                                         | User not authenticated                                                                            |
| 403 Forbidden            | The request contained valid data and was understood by the server, but the server is refusing action ͤ                                                                                   | Operation not authorized, the authenticated user does not have permissions to perform the action. |
| 404 Not Found            | The requested resource could not be found but may be available in the future | Record not found in the database                                                                         | Record not found in the database                                                                  |
| 409 Conflict             | Indicates that the request could not be processed because of conflict in the current state of the resource, such as an edit conflict between multiple simultaneous updates.             | [Optimistic concurrency control](https://en.wikipedia.org/wiki/Optimistic_concurrency_control)    |
| 410 Gone                 | Indicates that the resource requested is no longer available and will not be available again.                                                                                           | Soft deletion                                                                                     |
| 422 Unprocessable Entity | Indicates that the server understands the content type of the request entity, and the syntax of the request entity is correct, but it was unable to process the contained instructions. | Business validation                                                                               |

ͣ  e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing
ͤ  This may be due to the user not having the necessary permissions for a resource or needing an account of some sort, or attempting a prohibited action.

###### Server Errors

The server failed to fulfil an apparently valid request (5xx server error)

| Code                      | Description                                                                                                                                      | Scenario                                                                                                                                     |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| 500 Internal Server Error | Generic error message, given when an unexpected condition was encountered and no more specific message is suitable.                              | Unhandled Exceptions (shouldn’t be thrown explicitly)                                                                                        |
| 501 Not Implemented       | The server either does not recognize the request method, or it lacks the ability to fulfil the request. Usually this implies future availability | Not Implemented logic or condition, to be available soon                                                                                     |
| 502 Bad Gateway           | This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response    | Indicates an invalid response from an upstream server                                                                                        |
| 503 Service Unavailable   | The server is not ready to handle the request                                                                                                    | Indicates that something unexpected happened on server side (It can be anything like server overload, some parts of the system failed, etc.) |

## Pending

- HTTP verbs vs codes & payloads (e.g. a GET shouldn't ever return a 201)
  - 4xx
  - 5xx
- Idempotent operations
- Cross-Origin Resource Sharing (CORS)
- Command Query Responsibility Segregation (CQRS)
- HEAD Verb, should we use it? (e.g. check that the entity exists)
- Fragments in request's URL
- [`X-HTTP-Method-Override` header](https://docs.microsoft.com/en-us/aspnet/web-api/overview/advanced/http-message-handlers#example-x-http-method-override)
- [HATEOAS](https://restfulapi.net/hateoas/) response payloads (success operations)
- Cache control (only for GET requests)
  - Client-side caching
  - Server side caching; e.g Distributed cache (Redis, etc.) vs API Gateway caching
    - cache-control header to fetch "fresh" data or use URL fragments (#)
  - Cache-Control header
  - Expires header
  - Last-Modified header
- Compression (gzip in the content-encoding response's header)
- Stateless
- Documentation
  - Swagger by default
- Add a section in this document for DOs and DON'Ts
- Section for FAQ

## More Information

- [Representational state transfer - Wikipedia](https://en.wikipedia.org/wiki/Representational_state_transfer)
- [What is REST (restfulapi.net)](https://restfulapi.net/)
- [Request Methods - Hypertext Transfer Protocol | Wikipedia](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)
- [List of HTTP status codes | Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
- [HATEOAS - Wikipedia](https://en.wikipedia.org/wiki/HATEOAS)
- [Web API design best practices - Azure Architecture Center | Microsoft Docs](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
- [Top 12 Best Practices for RESTful API Architecture (bacancytechnology.com)](https://www.bacancytechnology.com/blog/rest-api-best-practices)
- [Model validation in ASP.NET Core MVC | Microsoft Docs](https://docs.microsoft.com/en-us/aspnet/core/mvc/models/validation?view=aspnetcore-5.0)
- [HTTP response status codes - HTTP | MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)
- [Best practices for REST API design - Stack Overflow Blog](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/)
- [Pagination in the REST API (atlassian.com)](https://developer.atlassian.com/server/confluence/pagination-in-the-rest-api/)
