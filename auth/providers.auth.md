# Auth - Providers

## Local providers

Here are some of the [Open ID Connect](./openid.auth.md) providers that can run locally:

- [Authentik](https://goauthentik.io/)
- [Authelia](https://www.authelia.com/)
- [Casdoor](https://casdoor.org/)

  Docker command

  ```sh
  docker run -p 8000:8000 casbin/casdoor-all-in-one
  ```

  Url

  ```http
  GET http://localhost:8000/
  ```

  Admin credentials

  - Username: `admin`
  - Password: `123`

  Discovery url

  ```http
  http://localhost:8000/.well-known/openid-configuration
  ```

- [FusionAuth](https://fusionauth.io/)
- [Gluu](https://www.gluu.org/)
- [Kanidm](https://www.kanidm.dev/)
- [Keycloak](https://www.keycloak.org/)

  Docker command

  ```sh
  docker run -p 127.0.0.1:8080:8080 -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:26.4.7 start-dev
  ```

  Url

  ```http
  GET http://127.0.0.1:8080/
  ```

  Admin credentials

  - Username: `admin`
  - Password: `admin`

  Discovery url

  > The following example uses the built-in _realm_

  ```http
  GET http://127.0.0.1:8080/realms/master/.well-known/openid-configuration
  ```

- [Logto](https://logto.io/)
- [Ory](https://www.ory.sh/)
- [Zitadel](https://zitadel.com/)

## SaaS providers

Here are some cloud-hosted authentication providers with hosted identity services:

- [Microsoft Entra ID](https://www.microsoft.com/security/business/identity)
- [Google Identity](https://cloud.google.com/identity)
- [AWS Cognito](https://aws.amazon.com/cognito/)
- [Clerk](https://clerk.dev/)
- [Auth0](https://auth0.com/)
- [Okta](https://www.okta.com/)
- [Firebase Authentication](https://firebase.google.com/products/auth)
- [Supabase Auth](https://supabase.com/auth)
- [Magic](https://magic.link/)
