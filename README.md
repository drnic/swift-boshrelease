# Bosh release for OpenStack Swift Object Store

## Usage

### Create & Upload the BOSH release

To use this BOSH release, first create the dev release, then the final release, then upload it to your BOSH director:

```
bosh target BOSH_HOST
git clone https://github.com/emc-cloudfoundry/swift-boshrelease.git
cd swift-boshrelease
bosh create release --force
bosh create release --force --final
bosh upload release
```

### Create a BOSH deployment manifest

Please refer to the files example-manifest.yml and example-manifest-ha.yml for examples of the deployment manifest.
example-manifest.yml creates 1 swift proxy node and 5 swift storage nodes.
The example-manifest.yml create 2 swift proxy nodes and 5 swift storage nodes and uses the emc-haproxy BOSH release to provide high availability and load balancing

### Deploy using the BOSH deployment manifest

Using the previous created deployment manifest, now we can deploy it:

```
bosh deployment path/to/deployment.yml
bosh -n deploy
```

