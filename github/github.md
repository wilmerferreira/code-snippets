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
