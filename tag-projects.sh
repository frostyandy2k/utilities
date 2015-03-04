#!/bin/bash
message="stable demo setup with example files and expanded data. Now contains MIT license"
commitMessage="added MIT license"
version="v0.3"

declare -a project_folders=("style-extractor" "wizard-client" "wizard-api" "docker-demo-deployment" "reactor" "demo_servers_bike" "bike_dsl" "adapters" "file_monitor")

for D in "${project_folders[@]}"; do
    if [ -d "${D}" ]; then
        cd "${D}"
        echo -e "\033[0;31m Processing ${D} \033[0m"
        
        # do a commit and push before tagging
        echo -e "\033[0;31m Commiting and pushing \033[0m"
        git commit -a -m "$commitMessage"
        git push
        
        # echo -e "\033[0;31m Overwirte existing tag (delete and recreate) \033[0m"
        # git tag -d $version
        # git push origin :refs/tags/$version

        echo -e "\033[0;31m Creating and pushing tag \033[0m"
        git tag -a $version -m "$message" && git push origin $version
        cd ..
    fi
done

# execdir

# delete Tags
# git tag -d $version
# git push origin :refs/tags/$version