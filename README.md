# Real Estate NFT for real estate tokenization

## :warning: Disclaimer :warning:

:bangbang: Author CAN NOT GUARANTEE the safety of the repository, referring to links to external webpages from files in this repository, the repository files themselves and all the primary and subsequent installed packages using installation commands.

:bangbang: The author of this repository IS NOT RESPONSIBLE for the use of the repository and the security issues working with it could produce.

## Description

Due to the rise of RWA in current blockchain ecosystem, this collection tries to reprensent different real estate assets, where the owner of a token should be the real owner of the asset outside the digital realm.

## Environment

1. First of all, install all dependencies executing:

   ```
   forge install
   ```

2. Make a copy of .env.template and rename it to .env

3. Set up the required environment variables

## Compile

1. Compile all the contracts:

   ```
   forge build
   ```

## Test

1. Run all the tests:

   ```
   forge test
   ```

2. Run a specific test:
   ```
    forge test --mt testRevertWhenCallingInitializeAgain
   ```

## Work in progress...