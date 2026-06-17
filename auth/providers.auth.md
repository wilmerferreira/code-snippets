# Auth: Providers

Here are some of the [Open ID Connect](./openid.auth.md) providers that can run locally:

- [Authentik](https://goauthentik.io/)
- [Authelia](https://www.authelia.com/)
- [Keycloak](https://www.keycloak.org)

  Docker

  ```sh
  docker run -p 127.0.0.1:8080:8080 -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:26.4.7 start-dev
  ```

  Url

  ```http
  GET http://localhost
  ```

  Admin credentials

  - Username: `admin`
  - Password: `admin`

  Discovery url:

  ```http
  GET http://localhost:8080/realms/master/.well-known/openid-configuration
  ```

- [Zitadel](https://zitadel.com/)
- [Ori Hydra](https://www.ory.com)
- [Casdoor](https://casdoor.org/)
- [Logto](https://logto.io/)
- [FusionAuth](https://fusionauth.io)
- [Gluu](https://gluu.org)
- [Kanidm](https://kanidm.com/)
