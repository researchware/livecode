#!/bin/bash

source "${BASEDIR}/scripts/platform.inc"
source "${BASEDIR}/scripts/lib_versions.inc"
source "${BASEDIR}/scripts/util.inc"

function buildExternal {
	local EXTERNAL_NAME=$1
	local EXTERNAL_CLONE_URL=$2

	local EXTERNAL_VERSION_VAR=${EXTERNAL_NAME}_VERSION
	local EXTERNAL_HASH=${!EXTERNAL_VERSION_VAR}

	local EXTERNAL_BUILDREVISION_VAR=${EXTERNAL_NAME}_BUILDREVISION
	local EXTERNAL_BUILDREVISION=${!EXTERNAL_BUILDREVISION_VAR}

	local CLONE_DIR="${EXTERNAL_NAME}_${EXTERNAL_HASH}_${EXTERNAL_BUILDREVISION}"

	echo "Cloning ${EXTERNAL_CLONE_URL}"
	git clone --recursive "${EXTERNAL_CLONE_URL}" "${CLONE_DIR}"
	if [ $? != 0 ] ; then
		echo "    failed"
		exit
	fi

	cd "${CLONE_DIR}"
	echo "Restting to ${EXTERNAL_HASH}"
	git reset --hard "${EXTERNAL_HASH}"

	mkdir -p "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}"

	case "${PLATFORM}" in
		mac)
			echo "Building ${EXTERNAL_NAME} for Desktop"
			xcodebuild \
				-project "${EXTERNAL_NAME}.xcodeproj" \
				-configuration $MODE \
				-sdk $SUBPLATFORM \
				-target "${EXTERNAL_NAME}-OSX" \
				VALID_ARCHS="${UNIVERSAL_ARCHS}" \
				ARCHS="${UNIVERSAL_ARCHS}" \
				CODE_SIGN_IDENTITY="LiveCode Ltd." \
				ONLY_ACTIVE_ARCH=NO \
				build \
				-UseModernBuildSystem=NO

			cp -a "build/${EXTERNAL_NAME}.bundle" "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}"

			echo "Building ${EXTERNAL_NAME} for Server"
			xcodebuild \
				-project "${EXTERNAL_NAME}.xcodeproj" \
				-configuration $MODE \
				-sdk $SUBPLATFORM \
				-target "${EXTERNAL_NAME}-Server" \
				VALID_ARCHS="${UNIVERSAL_ARCHS}" \
				ARCHS="${UNIVERSAL_ARCHS}" \
				CODE_SIGN_IDENTITY="LiveCode Ltd." \
				ONLY_ACTIVE_ARCH=NO \
				build \
				-UseModernBuildSystem=NO

			cp "build/${EXTERNAL_NAME}.dylib" "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}"
			
			;;
		linux)
			if [[ "${ARCH}" == "x86_64" ]]; then
				make "${EXTERNAL_NAME}-x64.so"
				cp "build/${EXTERNAL_NAME}-x64.so" "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}"
			else
				make "${EXTERNAL_NAME}-x86.so"
				cp "build/${EXTERNAL_NAME}-x86.so" "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}"
			fi
			;;
		android)
			# Local variables
			export SRCROOT="${BUILDDIR}/${CLONE_DIR}/${EXTERNAL_NAME}"
			export JCOUNT=20
			export DEBUGGABLE_FLAG=false
			export DEBUG_FLAG=0
			export DSTROOT=$SRCROOT/_build/android/$MODE
			export RAWROOT=$SRCROOT/_build/android/$MODE/assets

			# Build the native code components
			export NDK_PROJECT_PATH=$DSTROOT
			echo "Building native code components..."
			$NDKBUILD NDK_DEBUG=$DEBUG_FLAG NDK_APP_DEBUGGABLE=$DEBUGGABLE_FLAG NDK_APPLICATION_MK=$SRCROOT/Application.mk -j $JCOUNT -s
			if [ $? != 0 ]; then
				exit $?
			fi

			mkdir -p "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}/Android"
			cp "${DSTROOT}/libs/${ARCH}/lib${EXTERNAL_NAME}.so" "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}/Android/External-${ARCH}"
			;;
		ios)
			echo "Symlinking in lclink.sh"
			export LIVECODE_SDK_ROOT="${BUILDDIR}/${CLONE_DIR}"
			mkdir tools
			cd tools
			ln -s "${BASEDIR}/../lcidlc/lclink.sh" "lclink.sh"
			cd ..

			echo "Building ${EXTERNAL_NAME}"
			xcodebuild \
				-project "${EXTERNAL_NAME}.xcodeproj" \
				-configuration $MODE \
				-sdk $SUBPLATFORM_NAME \
				-target "${EXTERNAL_NAME}-iOS" \
				VALID_ARCHS="${UNIVERSAL_ARCHS}" \
				ARCHS="${UNIVERSAL_ARCHS}" \
				CODE_SIGN_IDENTITY="LiveCode Ltd." \
				build \
				-UseModernBuildSystem=NO

			unzip "binaries/${EXTERNAL_NAME}.lcext" -d "${OUTPUT_DIR}/lib/${PLATFORM}/${ARCH}"
			;;
	esac
}

cd "${BUILDDIR}"

buildExternal "mergJSON" "https://github.com/montegoulding/mergjson.git"

