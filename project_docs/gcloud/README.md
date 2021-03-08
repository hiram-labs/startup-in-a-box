## Google Cloud Platform

**_Create a GCP account and add a project_**

---

### Google Cloud SDK

**_This project bundles a containerised Google Cloud CLI_**

- From root of project SSH into the container

```
yarn start-gcloud
```

---

### Authentication

**_Google allows for automated authentication using a key file_**

- Navigate to GCP dashboard with a browser

```
click navigation menu > IAM & Admin > service account
```

- At the top _(using suggested name: robot-01)_
- Once created download a key file for this account

```
click create service account
```

- Rename and save the JSON key file at

```
./service_000_gcloud/secrets/gcloud-key.json
```

---

### Scripts

**_Predefined scripts are used to automate tasks_**

- Cd to the _shell scripts_ folder. Use `ls` to know current folder list by default all .sh scripts can be found here `./service_000_gcloud/scripts/shell`

```
ls
cd <path>/scripts
```

- Give execution rights to all .sh by running below command once inside `scripts/shell` directory

```
find . -type f -iname "*.sh" -exec chmod +x {} \;
```

- then run required script NB some scripts require arguments

```
./<script-name>.sh <add arg if required>
```

---

### Initialise Session

**_A fresh session is always created on each `yarn start-gcloud`_**

- `cd` to shell folder _Hint: ref scripts section above_.
- if your project name is different from `project_id` inside the json key file downloaded earlier from GCP website, add your project name as argument to command below.

```
./init.sh <optional project name>
```

---

### Add GKE cluster

**_Setup an e2-small machine type cluster_**

- `cd` to shell folder _Hint: ref scripts section above_.
- Add an argument at `position 1` to command below to specify cluster name, defaults to `general`
- Add an argument at `position 2` to command below to specify number of nodes, defaults to `2`

```
./cluster.sh <optional cluster name> <optional number of nodes>
```

---

### Connect to GKE cluster

**_Set the cluster kubectl command talks to_**

- Cd to shell folder _ref scripts section above_
- Add an argument to command below to specify cluster name to connect to, defaults to `general` if available.

```
./connect.sh <optional cluster name>
```

### Create Jenkins Service

**_Setup Jenkins for the project_**

- Cd to shell folder _ref scripts section above_
- If the session is not authenticate run `./init.sh first` otherwise run code below.

```
./jenkins.sh
```
