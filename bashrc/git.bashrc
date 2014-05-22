# Sort git branches by date modified (from least to most recent)
gbsort(){
  fmt='

  subject=%(subject)
  branchname=%(refname:short)
  lastupdated_notz=$(echo %(committerdate:iso8601) | cut -d" " -f -2)
  author="%(authorname) %(authoremail)"

  echo "$branchname"
  echo "   • Last Updated: $lastupdated_notz"
  echo "   • Updated By:  $author" | perl -pe "s/'\''(\s)'\''|(\s)'\''|'\''($)/\$1/g"
  echo "   • Description: $subject"
  echo
  '

  eval=`git for-each-ref --shell --format="$fmt" --sort=committerdate refs/heads`

  eval "$eval"
}
