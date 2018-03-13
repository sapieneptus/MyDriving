#!/usr/bin/env bash
if [ "$MOBILECENTER_BRANCH" == "master" ];
then
    msbuild /p:Configuration=Debug $MOBILECENTER_SOURCE_DIRECTORY/src/MobileApps/MyDriving/MyDriving.UITests/MyDriving.UITests.csproj
    appcenter test run uitest \
                --app "chfuen/MyDriving-iOS-d-d-d-Demo" \
                --devices "chfuen/ios-demo-set" \
                --app-path $MOBILECENTER_OUTPUT_DIRECTORY/MyDrivingiOS.ipa \
                --test-series "master" \
                --locale "en_US" \
                --build-dir $MOBILECENTER_SOURCE_DIRECTORY/src/MobileApps/MyDriving/MyDriving.UITests/bin/Debug/ \
                --token e523d067ef6057d6ac8db59cd8b621be771cfa5d
else
    echo "Current branch is $MOBILECENTER_BRANCH"
fi
