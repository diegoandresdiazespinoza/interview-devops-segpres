resource "kubernetes_manifest" "service_backendv1" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "backendv1"
      }
      "name" = "backendv1"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "8080"
          "port" = 8080
          "targetPort" = 8080
        },
      ]
      "selector" = {
        "io.kompose.service" = "backendv1"
      }
    }
    "status" = {
      "loadBalancer" = {}
    }
  }
}

resource "kubernetes_manifest" "service_backendv2" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "backendv2"
      }
      "name" = "backendv2"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "5000"
          "port" = 5000
          "targetPort" = 5000
        },
      ]
      "selector" = {
        "io.kompose.service" = "backendv2"
      }
    }
    "status" = {
      "loadBalancer" = {}
    }
  }
}

resource "kubernetes_manifest" "service_frontend" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "frontend"
      }
      "name" = "frontend"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "4100"
          "port" = 4100
          "targetPort" = 4100
        },
      ]
      "selector" = {
        "io.kompose.service" = "frontend"
      }
    }
    "status" = {
      "loadBalancer" = {}
    }
  }
}

resource "kubernetes_manifest" "deployment_backendv1" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "backendv1"
      }
      "name" = "backendv1"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "io.kompose.service" = "backendv1"
        }
      }
      "strategy" = {}
      "template" = {
        "metadata" = {
          "annotations" = {
            "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
            "kompose.version" = "1.26.1 (a9d05d509)"
          }
          "creationTimestamp" = null
          "labels" = {
            "io.kompose.service" = "backendv1"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "backendv1"
              "name" = "backendv1"
              "ports" = [
                {
                  "containerPort" = 8080
                },
              ]
              "resources" = {}
            },
          ]
          "restartPolicy" = "Always"
        }
      }
    }
    "status" = {}
  }
}

resource "kubernetes_manifest" "deployment_backendv2" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "backendv2"
      }
      "name" = "backendv2"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "io.kompose.service" = "backendv2"
        }
      }
      "strategy" = {}
      "template" = {
        "metadata" = {
          "annotations" = {
            "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
            "kompose.version" = "1.26.1 (a9d05d509)"
          }
          "creationTimestamp" = null
          "labels" = {
            "io.kompose.service" = "backendv2"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "backendv2"
              "name" = "backendv2"
              "ports" = [
                {
                  "containerPort" = 5000
                },
              ]
              "resources" = {}
            },
          ]
          "restartPolicy" = "Always"
        }
      }
    }
    "status" = {}
  }
}

resource "kubernetes_manifest" "deployment_frontend" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "frontend"
      }
      "name" = "frontend"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "io.kompose.service" = "frontend"
        }
      }
      "strategy" = {}
      "template" = {
        "metadata" = {
          "annotations" = {
            "kompose.cmd" = "kompose convert -f docker-compose.yml --controller deployment --out k8s-manifests"
            "kompose.version" = "1.26.1 (a9d05d509)"
          }
          "creationTimestamp" = null
          "labels" = {
            "io.kompose.service" = "frontend"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "frontend"
              "name" = "frontend"
              "ports" = [
                {
                  "containerPort" = 4100
                },
              ]
              "resources" = {}
            },
          ]
          "restartPolicy" = "Always"
        }
      }
    }
    "status" = {}
  }
}
