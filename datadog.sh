#!/bin/bash
data=$(cat <<EOF
{
	"title": "Deployment",
	"text": "'$CI_COMMIT_SHA' has been deployed.",
	"priority": "normal",
	"tags": ["deployment", "$CI_ENVIRONMENT_NAME", "$CI_PROJECT_NAME"],
	"alert_type": "info"
}
EOF
)

curl -XPOST "$WEBHOOK_DATADOG" -d "$data"
