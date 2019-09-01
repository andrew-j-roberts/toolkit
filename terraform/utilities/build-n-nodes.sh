#!/bin/bash
#
# build-n-nodes.sh
#
# Forms the provided number of terraform files,
# then runs terraform apply to build them all.
# - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + -

cd `dirname $0`

function msg() {
  line="- + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + "
  echo ""; echo "$line"; echo "$*"; echo "$line"; echo ""
}

if [ "$#" -ne 2 ]; then
	echo "  USAGE: $0 <NODE_PREFIX> <NODE_COUNT>"
	echo ""
	exit 0
fi
NODE_PREFIX=$1
NODE_COUNT=$2

msg "Creating a terraform and cloud config file for each consumer node"
cd terraform
for (( i = 0; i < $NODE_COUNT; i++ )) 
do 
  cat <TEMPLATE_LOCATION> \ # E.g. templates/ec2.template.tf
  | sed -e "s/__NODE_PREFIX__/$NODE_PREFIX/g" \
  | sed -e "s/__NODE_NAME__/node-$i/g" \
  > $NODE_PREFIX-node-$1.tf
  echo "Created $NODE_PREFIX-node-$1.tf"
done

# build cloud resources from generated terraform files
terraform init
terraform apply
cd ..
