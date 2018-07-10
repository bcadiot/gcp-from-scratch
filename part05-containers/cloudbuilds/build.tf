resource "google_sourcerepo_repository" "demo" {
  name    = "itworks"
  project = "${data.google_project.project.id}"
}

resource "google_cloudbuild_trigger" "build_trigger" {
  project = "${data.google_project.project.id}"

  trigger_template {
    branch_name = "master"
    repo_name   = "${google_sourcerepo_repository.demo.name}"
  }

  build {
    images = ["eu.gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA"]

    step {
      name = "gcr.io/cloud-builders/docker"
      args = "build -t eu.gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA -f Dockerfile ."
    }
  }
}
