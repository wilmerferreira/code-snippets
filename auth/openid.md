# OpenID Connect

OpenID Connect (OIDC) is an identity authentication protocol that **is an extension of open authorization (OAuth) 2.0** to standardize the process for authenticating and authorizing users when they sign in to access digital services. **OIDC provides authentication**, which means verifying that users are who they say they are. OAuth 2.0 authorizes which systems those users are allowed to access. OAuth 2.0 is typically used to enable two unrelated applications to share information without compromising user data. For example, many people use their email or social media accounts to sign in to a third-party site rather than creating a new username and password. OIDC is also used to provide single sign-on.

## Discovery

OpenID Connect defines a discovery mechanism, called OpenID Connect Discovery, where an OpenID server publishes its metadata at a well-known URL, typically `https://server.com/.well-known/openid-configuration`

This URL returns a JSON listing of the OpenID/OAuth endpoints, supported scopes and claims, public keys used to sign the tokens, and other details. The clients can use this information to construct a request to the OpenID server. The field names and values are defined in the OpenID Connect Discovery Specification. Here is an example of data returned:

```jsonc
{
  "issuer": "https://example.com/",
  "authorization_endpoint": "https://example.com/authorize",
  "token_endpoint": "https://example.com/token",
  "userinfo_endpoint": "https://example.com/userinfo",
  "jwks_uri": "https://example.com/.well-known/jwks.json",
  "scopes_supported": [
    "pets_read",
    "pets_write",
    "admin"
  ],
  "response_types_supported": [
    "code",
    "id_token",
    "token id_token"
  ],
  "token_endpoint_auth_methods_supported": [
    "client_secret_basic"
  ],

  // ...

}
```

## More Information

- [What is OpenID Connect](https://openid.net/developers/how-connect-works/)
- [OpenID Connect & OAuth 2.0 API](https://developer.okta.com/docs/reference/api/oidc/)
  - [/.well-known/oauth-authorization-server](https://developer.okta.com/docs/reference/api/oidc/#well-known-oauth-authorization-server)
  - [/.well-known/openid-configuration](https://developer.okta.com/docs/reference/api/oidc/#well-known-openid-configuration)
- [Specs](https://openid.net/specs/)
  - [Registration](https://openid.net/specs/openid-connect-registration-1_0-final.html)
  - [Discovery Metadata](https://openid.net/specs/openid-connect-discovery-1_0-final.html#ProviderMetadata)
