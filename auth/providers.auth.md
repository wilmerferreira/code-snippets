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

- FusionAuth
- Gluu
- Kanidm
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

- Logto
- Ory
- Zitadel
