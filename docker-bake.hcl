variable "TAG" {
    default = "latest"
    description = "The tag for the application."
}

variable "COMMIT_SHA" {
    default = ""
    description = "The commit SHA for the application."
}

variable "NODE_VERSION" {
    default = "22"
    description = "The version of Node.js to use."
}

variable "APP_NAME" {
    default = "myapp"
    description = "The name of the application."
}

group "default" {
    targets = ["linux-amd64", "linux-arm64"]
}
target "base" {
    context = "."
    dockerfile = "Dockerfile"
    args = {
        NODE_VERSION = NODE_VERSION
    }
    pull = true
    no-cache = true
    labels = {
        maintainer = "me@subhransude.dev"
    }
}

target "linux-amd64" {
    inherits = ["base"]
    platform = "linux/amd64"
    tags = [
    "${APP_NAME}:${TAG}-amd64",
    "${APP_NAME}:${COMMIT_SHA}-amd64"
  ]
}

target "linux-arm64" {
    inherits = ["base"]
    platform = "linux/arm64"
    tags = [
    "${APP_NAME}:${TAG}-arm64",
    "${APP_NAME}:${COMMIT_SHA}-arm64"
  ]
}

