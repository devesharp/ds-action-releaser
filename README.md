# ds-action-releaser

Example use:

```yaml
name: Test Unit

on: [push]
    
jobs:
   test:
      runs-on: ubuntu-latest

      steps:
         -  uses: actions/checkout@v1

         -  uses: devesharp/ds-action-releaser@master
            with:
               type: 'semantic'
               github_token: ${{ secrets.GITHUB_TOKEN }}
```
