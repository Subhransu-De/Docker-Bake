variable "APP_NAME" {
    default = "myapp"
    description = "The name of the application."
}
variable "NODE_VERSION" {
    default = "22"
    description = "The version of Node.js to use."
}

variable "TAG" {
    default = "latest"
    description = "The tag for the application."
}

variable "COMMIT_SHA" {
    default = ""
    description = "The last commit's SHA."
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
        maintainer = "Subhransu-De"
    }
    output = ["type=docker"]
}

group "default" {
    targets = ["build"]
}

target "build" {
    inherits = ["base"]
    name = "${APP_NAME}-${replace(tgt, "/", "-")}"
    matrix = {
        tgt = ["linux/amd64", "linux/arm64"]
    }
    platforms = [tgt]
    tags = [
        "${APP_NAME}:${TAG}-${replace(tgt, "linux/", "")}",
        "${APP_NAME}:${COMMIT_SHA}-${replace(tgt, "linux/", "")}"
    ]
}