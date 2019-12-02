#!/bin/bash
commit_url="https://gitlab.com/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/commit/$CI_COMMIT_SHA"
job_url="https://gitlab.com/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/-/jobs/$CI_JOB_ID"
app_url="https://$BUCKET_NAME"
data=$(cat <<EOF
    {
    	"username": "90Seconds Bot",
    	"icon_emoji": ":90:",
			"channel": "$SLACK_CHANNEL",
    	"attachments": [{
    		"fallback": "",
    		"pretext": "",
    		"color": "$1",
    		"fields": [{
    			"title": "URL",
    			"value": "$app_url",
    			"short": true
    		}, {
    			"title": "Tag",
    			"value": "$CI_COMMIT_SHA",
    			"short": true
    		}, {
    			"title": "Deployment Log",
    			"value": "$job_url",
    			"short": true
    		}, {
    			"title": "Deployment Changes",
    			"value": "$commit_url",
    			"short": true
    		}]
    	}]
    }
EOF
)
curl -XPOST "$WEBHOOK_SLACK" -d "$data"
