# Animals

[![Release](https://github.com/cicd-tutorials/animals/actions/workflows/release.yaml/badge.svg)](https://github.com/cicd-tutorials/animals/actions/workflows/release.yaml)

Simple containers for testing and demonstrating (rolling) updates. Based on [UpCloudLtd / hello-container](https://github.com/UpCloudLtd/hello-container.git). Uses the same [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) styling as [cicd-tutorials.net](https://cicd-tutorials.net/).

## Usage

To create a deployment and expose it from your Kubernetes cluster, run:

```sh
kubectl create deployment --image=ghcr.io/cicd-tutorials/animals:cow moo
kubectl expose deployment moo --port=80 --target-port=80 --type=LoadBalancer
kubectl get svc -w
```

This process might take a few minutes. After external IP for hello service is visible, use it to test that pod is reachabe from the internet.

## Development

Build `animals` image with:

```sh
docker build . -t animals

# With version note
docker build . -t animals --build-arg "VERSION_NOTE=at $(git rev-parse HEAD)"

# With all build args
docker build . -t animals \
  --build-arg "VERSION_NOTE=at $(git rev-parse HEAD)" \
  --build-arg "EMOJI=🦁" \
  --build-arg "HELLO=Moo" \
  --build-arg "NAME=horse"
```

Run `animals` with:

```sh
docker run -i -p 8080:80 --rm animals
```
