# JWT

JSON Web Tokens are an open, industry standard RFC 7519 method for representing claims securely between two parties.

It consists in 3 parts

- Header

  ```json
  {
    "alg": "HS256",
    "typ": "JWT"
  }
  ```

- Payload

  ```json
  {
    "username": "admin",
    "admin": true,
    "iat": 1494440699, // Issued at
    "exp": 1494455099  // Expiration
  }
  ```

- Signature

Other considerations:

- Any endpoints requiring authentication should receive an `Authorization` header with the following format: `Bearer <YOUR_TOKEN>`
- If the user is not authenticated the endpoint should return a `401` error (`Unauthorized`), used when authentication is required and has failed or has not yet been provided)

## More Information

- [JSON Web Tokens](https://jwt.io/)
