basicPath="/Users/brown/dev"

echo "Only Organizition repos!!!"
echo "enter git address: "
read address

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
