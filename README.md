This repo has scripts to run gitlab ci-cd.
=========================================


Folders:
=======
    ** gitlab-runner: scripts to run/register gitlab runners.
    ** gitlab-runner/certs: place your gitlab's certificates in here so that the gitlab-runner can interact with your gitlab. eg, cp <your cert> ./certs/ca-certificates.crt

Usage:
=====
    1. Run gitlab runner:
        ** Find your gitlab ci/cd information in Settings->CI/CD->Runers
        ** Run gitlab-runnner/run.sh
        ** Enter information when prompted.
