#!/bin/bash

OS_VERSION=$1
KERNEL_VERSION=$(jq -r ".[\"${OS_VERSION}\"]" versions.json)

cd $(dirname $0)

if [ $KERNEL_VERSION = "null" ]; then
  echo "Unsupported OS version are specified: $OS_VERSION"
  exit 1
fi

BUILDDIR=$(mktemp -d build.XXXXXX)
mkdir -p ${BUILDDIR}/{SOURCES,SPECS,SRPMS}
cp -p macros.lustre-client.in ${BUILDDIR}/SOURCES
sed \
  -e "s/@@@OS_VERSION@@@/${OS_VERSION}/g" \
  -e "s/@@@KERNEL_VERSION@@@/${KERNEL_VERSION}/g" \
  lustre-client-build.spec.in > ${BUILDDIR}/SPECS/lustre-client-build.spec


rpmbuild --define "_topdir ./${BUILDDIR}" -bs ${BUILDDIR}/SPECS/lustre-client-build.spec

for i in $(find ./${BUILDDIR}/SRPMS/ -type f -name '*.rpm'); do
  cp $i ./
done

rm -rf ${BUILDDIR}
