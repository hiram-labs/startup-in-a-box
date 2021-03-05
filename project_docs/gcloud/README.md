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

```
click create service account
```

- Rename and save the JSON key file at

```
./service_000_gcloud/secrets/gcloud-key.json
```

---

### Scripts

**_Predefined scripts are used to automate task_**

- Cd to the shell script folder by ls to know current folder list by default all .sh scripts can be found here _./service_000_gcloud/scripts/shell_

```
ls
cd <path>/scripts
```

- Give execution rights to all .sh once inside that directory

```
find . -type f -iname "*.sh" -exec chmod +x {} \;
```

- then run required script NB some scripts require arguments

```
./<script-name>.sh <add arg if required>
```

---

### Initialise Session

**_A fresh sesion is always created when yarn `start-gcloud` is called_**

- Cd to shell folder _ref scripts section above_
- if your project name is different from `project_id` inside the json key file downloaded, add your project name as argument to command below.

```
./init.sh <optional project key>
```

---

### Add GKE cluster

**_Add a 2 node basic cluster to project_**

- Cd to shell folder _ref scripts section above_
- Add an argument to command below to specify cluster name, defaults to `production-unit`

```
./cluster.sh <optional cluster name>
```

---

### Connect to GKE cluster

**_Set the cluster kubectl command talks to_**

- Cd to shell folder _ref scripts section above_
- Add an argument to command below to specify cluster name to connect to, defaults to `production-unit` if available.

```
./connect.sh <optional cluster name>
```
