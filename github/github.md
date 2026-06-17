# GitHub

## Set no-reply email

By default git uses the email of the account configured in your local system, this is at least inconvenient, luckily this can be avoided by [changing the email in the config to a no-reply](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address#about-no-reply-email).

1. Using `ID+username`

   ```sh
   git config user.email "11060801+wilmerferreira@users.noreply.github.com"
   ```

2. Just using the _username_

   ```sh
   git config user.email "wilmerferreira@users.noreply.github.com"
   ```

## Common files

There are some common files used by open source projects, here are some of them:

- `README.md`
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `LICENSE.md`
- `SUPPORT.md`
- `CHANGELOG.md`
- `SECURITY.md`

All these files listed above can be found with the `.md` extension or without extension, however the following one must be created with the exact name.

- `CITATION.cff`
- `CODEOWNERS`

For more information check the [supported file types](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file#supported-file-types)
