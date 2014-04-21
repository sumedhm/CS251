To set proxy:

$export http_proxy=ironport2.iitk.ac.in:3128
$curl -L -o match.html --proxy-user username:password "http://www.espncricinfo.com/icc_cricket_worldcup2011/engine/match/$id.html?innings=$inn;page=1;view=commentary"

Please edit command for curl as given above.
