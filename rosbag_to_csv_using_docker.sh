DOCKER_IMAGE="autoware/autoware:1.12.0-kinetic-cuda" # rosが動けば本来なんでもいい
FILTER_TOPIC="/current_pose"
INPUT_ROSBAG="2020-05-11-19-59-53.bag"
CSV_FILE_NAME="out.csv"

docker run --rm -v ${PWD}:/rosbag -i ${DOCKER_IMAGE} bash << EOF
source ~/Autoware/install/setup.bash
rostopic echo -b "/rosbag/${INPUT_ROSBAG}" -p ${FILTER_TOPIC} > "/rosbag/${CSV_FILE_NAME}"
EOF

