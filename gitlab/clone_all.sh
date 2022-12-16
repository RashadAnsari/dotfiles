#!/bin/zsh

page=1
per_page=100
projects_file_name="projects.txt"
base_gitlab_url="https://gitlab.com"
private_token=$1

while true; do
    projects=$(curl --header "PRIVATE-TOKEN: $private_token" "$base_gitlab_url/api/v4/projects/?simple=yes&private=true&per_page=$per_page&page=$page")
    echo $projects | jq -r '.[] .ssh_url_to_repo' >> $projects_file_name
    ((page=page+1))
    if [[ "$projects" == "[]" ]]
    then
        break
    fi
done

while read line; do
    group=$(echo $line | awk -F[:/] '{print $2}')
    mkdir -p $group
    cd $group
    git clone $line
    cd ..
done < $projects_file_name

rm -rf $projects_file_name
