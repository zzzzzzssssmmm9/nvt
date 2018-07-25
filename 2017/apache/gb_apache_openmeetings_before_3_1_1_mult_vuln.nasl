###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_openmeetings_before_3_1_1_mult_vuln.nasl 7373 2017-10-06 13:51:46Z cfischer $
#
# Apache OpenMeetings < 3.1.1 Multiple Vulnerabilities
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, https://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112065");
  script_version("$Revision: 7373 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-06 15:51:46 +0200 (Fri, 06 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-05 15:09:22 +0200 (Thu, 05 Oct 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2016-0783", "CVE-2016-0784", "CVE-2017-2163", "CVE-2016-2164");

  script_name("Apache OpenMeetings < 3.1.1 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_apache_openmeetings_detect.nasl");
  script_require_ports("Services/www", 5080);
  script_mandatory_keys("Apache/Openmeetings/Installed");

  script_tag(name:"summary", value:"Apache OpenMeetings < 3.1.1 is prone to multiple vulnerabilities.");
  script_tag(name:"vuldetect", value:"Get the installed version with the help of the detection NVT and check if the version is vulnerable or not.");
  script_tag(name:"insight", value:"The following vulnerabilities exist in Apache OpenMeetings:

      -The hash generated by the external password reset function is generated by concatenating the user name and the current system time,
      and then hashing it using MD5. This is highly predictable and can be cracked in seconds by an attacker with knowledge of the user name of an OpenMeetings user (CVE-2016-0783).

      - The Import/Export System Backups functionality in the OpenMeetings Administration menu (http://domain:5080/openmeetings/#admin/backup) is vulnerable to path traversal
      via specially crafted file names within ZIP archives. By uploading an archive containing a file named ../../../public/hello.txt will write the file 'hello.txt'
      to the http://domain:5080/openmeetings/public/ directory. This could be used to, for example,
      overwrite the /usr/bin/convert file (or any other 3rd party integrated executable) with a shell script,
      which would be executed the next time an image file is uploaded and imagemagick is invoked (CVE-2016-0784).

      - When creating an event, it is possible to create clickable URL links in the event description.
      These links will be present inside the event details once a participant enters the room via the event.
      It is possible to create a link like 'javascript:alert('xss')', which will execute once the link is clicked.
      As the link is placed within an <a> tag, the actual link is not visible to the end user which makes it hard to tell if the link is legit or not (CVE-2016-2163).

      - When attempting to upload a file via the API using the importFileByInternalUserId or importFile methods in the FileService,
      it is possible to read arbitrary files from the system. This is due to that Java's URL class is used without checking what protocol handler is specified in the API call (CVE-2016-2164).");
  script_tag(name:"affected", value:"Apache OpenMeetings before version 3.1.1");
  script_tag(name:"solution", value:"Update your software to version 3.1.1 to fix the issue");

  script_xref(name:"URL", value:"https://openmeetings.apache.org/security.html");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

cpe = "cpe:/a:apache:openmeetings";

if(!port = get_app_port(cpe:cpe)){
  exit(0);
}

if(!ver = get_app_version(cpe:cpe, port:port)){
  exit(0);
}

if(version_is_less(version:ver, test_version:"3.1.1")){
  report = report_fixed_ver(installed_version:ver, fixed_version:"3.1.1");
  security_message(data:report, port:port);
  exit(0);
}

exit(99);
