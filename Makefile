define GetFromPkg
$(shell node -p "require('./.secrets/jks-secrets.json').$(1)")
endef

.PHONY: configure
configure: aws-configure fastlane-configure

.PHONY: aws-configure
aws-configure:
	if [ ! `which aws` ]; then\
		brew install awscli;\
	fi
	if [ ! -e $(HOME)/.aws ]; then\
		say "AWS GUI Consoleにログインして自分のAWS Tokenを設定してください";\
		aws configure;\
	fi

.PHONY: fastlane-configure
fastlane-configure:
	if [ "${profile}" = "" ]; then \
		aws secretsmanager get-secret-value --secret-id prod/goaluee/android/jks | jq -r '.SecretString|fromjson' > .secrets/jks-secrets.json; \
	else \
		aws secretsmanager --profile ${profile} get-secret-value --secret-id prod/goaluee/android/jks | jq -r '.SecretString|fromjson' > .secrets/jks-secrets.json; \
	fi

	echo "storePassword=$(call GetFromPkg,storePassword)\nkeyPassword=$(call GetFromPkg,keyPassword)\nkeyAlias=$(call GetFromPkg,keyAlias)\nstoreFile=../goaluee.jks" > ./android/key.properties

.PHONY: deploy-android
deploy-android:
	export PATH=$$PATH:/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/bin &&\
	export JAVA_HOME=/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home &&\
	cd android && fastlane internal;
