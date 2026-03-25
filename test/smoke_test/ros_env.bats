#!/usr/bin/env bats

setup() {
    load "${BATS_TEST_DIRNAME}/test_helper"
}

# -------------------- ROS environment --------------------

@test "ROS_DISTRO is set" {
    assert [ -n "${ROS_DISTRO}" ]
}

@test "ROS 1 setup.bash exists" {
    assert [ -f "/opt/ros/${ROS_DISTRO}/setup.bash" ]
}

@test "ROS 1 setup.bash can be sourced" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash"
    assert_success
}

# -------------------- SICK packages --------------------

@test "sick_safetyscanners2 is installed" {
    run dpkg -l ros-${ROS_DISTRO}-sick-safetyscanners2
    assert_success
}

# -------------------- System --------------------

@test "entrypoint.sh exists and is executable" {
    assert [ -x "/entrypoint.sh" ]
}
