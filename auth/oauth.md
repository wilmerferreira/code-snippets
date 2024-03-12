# OAuth

Is an open standard for access delegation, commonly used as a way for internet users to grant websites or applications access to their information on other websites but without giving them the passwords. This mechanism is used by companies to permit users to share information about their accounts with third-party applications or websites.

## Grant Types

- Authorization Code
- Proof Key for Code Exchange (PKCE)
- Client Credentials
- Device Code
- Refresh Token
- Implicit flow (legacy)
- Password grant (legacy)

```mermaid
sequenceDiagram
    autonumber
    participant Client as Consumer App <br /> (Client)
    participant Server as OAuth Server <br /> (Authentication Server)
    participant Resource as Resource Server

    Client->>Server: Authorization request
    activate Server
    Server-->>Client: Authorization grant
    deactivate Server

    Client->>Server: Authorization grant
    activate Server
    Server-->>Client: Access token
    deactivate Server

    Client->>Resource: Access token
    activate Resource
    Resource-->>Client: Protected resource
    deactivate Resource
```

## Registration

```mermaid
sequenceDiagram
    autonumber
    participant Client as Consumer App <br /> (Client)
    participant Server as OAuth Server <br /> (Authentication Server)

    Client->>Server: Register
    activate Server
    Server-->>Client: Response
    deactivate Server
```

- Resource owner (user)
- Scope: granular permissions
- Response type: authorization code

## More Information

- [OAuth 2.0](https://oauth.net/2/)
