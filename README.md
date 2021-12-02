# repo-template

The set template is as follows. (**Can be customized**)

* Applied .gitignore
* .gitignore file brings from .gitignore.io (default. "Python", "PyCharm+all", "macOS", "Linux", "Windows", "Terraform", "Node").
* Applied template of issue, label, pull request
* Release automation (using. release-drafter)
* Generates Release Notes (using. github-release-notes)
* Applied pre-commit hook (flake8)
* Applied Dependabot security updates (testing)



## labels.json
* At First, [Create Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)
* For label synchronization, you need to install the `github-label-sync` module.

```
# sudo npm install -g github-label-sync
```

* Label Synchronization
```
# sudo github-label-sync --access-token [액세스 토큰] --labels labels.json [계정명]/[저장소 이름]
```


## Install pre-commit
```
# pre-commit install
```
