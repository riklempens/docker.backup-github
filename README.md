
# Introduction

Based upon the work of [abusesa](https://github.com/abusesa/github-backup)
We changed the initial setup to meet our requirement to run the backup inside a docker container on a Synology NAS.

# Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Run](#run)
- [Maintenance](#maintenance)
- [References](#references)

# Prerequisites

### Create a token

For authorization you need to create a new personal GitHub token. You can do this from the GitHub settings, under the **Personal Access Tokens** tab.

![Step 1](images/new-token-1.png)

When you click the **Generate new token** button you enter the token creation screen. Here you should give the token a descriptive name and choose its *scopes*, which basically determine what the token is allowed to do.

![Step 2](images/new-token-2.png)

To backup public and private repositories you need to select only the **repo** scope. If you have no need for private repositories just choose the **public_repo** scope.

![Step 3](images/new-token-3.png)

After clicking the **Generate token** button you're presented with the generated token. Remember to store it now, as GitHub won't show it to you anymore!

In the next example let's assume your token is ```6b86190dd45c57c1a1b039a5a54d892e019102f7``` as in the above image.

# Installation

Clone this repository and build the docker container:

First build the docker container:

```bash
git clone git@github.com:riklempens/docker.backup-github.git
cd docker.backup-github
docker build --no-cache -t backup-github .
```

# Run

Start the docker container, please note you should adjust the volume mapping to your own needs.

```bash
docker run --rm \
  --name backup-github \
  -v /volume1/backups/github:/data \
  backup-github 6b86190dd45c57c1a1b039a5a54d892e019102f7
```

## Synology

We use Synology's task scheduler to make a daily backup of all GitHub repositories.

![synology scheduled task](images/synology-task.png)



# Maintenance

Check the progress of the backup:

```bash
docker logs -f backup-github
```


# References

* https://www.github.com
