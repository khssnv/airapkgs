{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, rosgraph
, roslaunch
, rosmaster
, rospy
, rosunit
}:

let
  pname = "rostest";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0bd7yyirjmz51vsp81h5y7f41375ksm1726jhn7apkf9hym1sl35";
  };

  propagatedBuildInputs = [ catkin rosgraph roslaunch rosmaster rospy rosunit ];

  meta = with stdenv.lib; {
    description = "Integration test suite based on roslaunch that is compatible with xUnit frameworks";
    homepage = http://wiki.ros.org/rostest;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
