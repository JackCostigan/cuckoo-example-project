#!/bin/bash

DIRECTORIES=$1

INPUT_FILES=""
SUPPRESSED_FILES=""
FINAL_FILES=""

if [ -z "$WORKSPACE_DIR" ]
then
    echo '$WORKSPACE_DIR must be set before calling cuckoo.sh'
    exit 1
else
    echo "workspace dir: $WORKSPACE_DIR"
fi

for DIRECTORY in ${DIRECTORIES//,/ }
do
  NEW_INPUT_FILES=$(find $PROJECT_DIR/../$DIRECTORY -type f -name *Type.swift)
  NEW_SUPPRESSED_FILES=$(grep -rl --include *.swift '//!no-mock' $PROJECT_DIR/../$DIRECTORY)
  INPUT_FILES=$(echo -e "$INPUT_FILES\n$NEW_INPUT_FILES")
  SUPPRESSED_FILES=$(echo -e "$SUPPRESSED_FILES\n$NEW_SUPPRESSED_FILES")
done

echo "Input Files:"
echo $INPUT_FILES

echo "Ignored Files:"
echo $SUPPRESSED_FILES

if [[ ! -z $SUPPRESSED_FILES ]]
then
  echo "Suppressing files!"
  FINAL_FILES="$(comm -13 <(echo $SUPPRESSED_FILES | tr ' ' '\n' | sort)  <(echo $INPUT_FILES | tr ' ' '\n' | sort))"
else
  echo "Not suppressing anything."
  FINAL_FILES=$INPUT_FILES
fi

echo "Final Files:"
echo $FINAL_FILES

# Create TestUtilities directory if it doesn't exist (e.g. it's not tracked by git)
mkdir -p $PROJECT_DIR/${PROJECT_NAME}Tests/TestUtilities/Mocks

# Define output file. Change "$PROJECT_DIR/Tests" to your test's root source folder, if it's not the default name.
OUTPUT_FILE="$PROJECT_DIR/${PROJECT_NAME}Tests/TestUtilities/Mocks/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Generate mock files, include as many input files as you'd like to create mocks for.
$WORKSPACE_DIR/Carthage/Checkouts/Cuckoo/run generate \
--output "${OUTPUT_FILE}" \
--testable $DIRECTORIES \
$FINAL_FILES

# After running once, locate `GeneratedMocks.swift` and drag it into your Xcode test target group.
