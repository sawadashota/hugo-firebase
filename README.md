# HUGO deploy to Firebase

## For What?
For CI to build HUGO and deploy to Firebase hosting.

## CircleCI Sample
```yml:.circleci/config.yml
version: 2

jobs:
  build:
    docker:
      - image: sawadashota/hugo-firebase:latest
    steps:
      - checkout
      - run: git submodule sync
      - run: git submodule update --init
      - run: |
          if [ "${CIRCLE_BRANCH}" == "master" ]; then
            HUGO_ENV=production hugo
            firebase deploy --only hosting --token $FIREBASE_TOKEN
          else
            echo "Not master branch so not deploying"
          fi
```
