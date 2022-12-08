basicPath="/Users/brown/dev"

echo "Notice Only Organizition repos!!!"
echo "Enter git address: "
read address
# address="https://github.com/Friktion-Labs"
orgs=$(echo $address | sed 's/https:\/\/github.com\///')
path="$basicPath/$orgs"
echo $(mkdir $path)

fileName="$path/$orgs.txt"
repo_data=$(curl "https://api.github.com/orgs/$orgs/repos")
wait
echo $repo_data >$fileName
wait

parsed_data=$(node parser.js $fileName)
split_data=$(echo $parsed_data | tr ";" "\n")

for url in $split_data; do
    # echo "git clone $url"
    echo $(git -C "$path" clone $url)
    wait
done

# ARR=("https://github.com/gmx-io/gmx-interface.git"
#     "https://github.com/gmx-io/gmx-synthetics.git"
#     "https://github.com/gmx-io/gmx-contracts.git"
#     "https://github.com/gmx-io/gmx-stats.git"
#     "https://github.com/gmx-io/gmx-subgraph.git"
#     "https://github.com/gmx-io/gmx-share-api.git"
#     "https://github.com/gmx-io/gmx-assets.git"
# )

# for url in "${ARR[@]}"; do
#     echo $(git clone $url)
#     wait
# done

# TEST=`(curl https://api.github.com/orgs/gmx-io/repos | jq .)`
