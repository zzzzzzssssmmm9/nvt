###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_session_fixation_vuln_lin.nasl 2016-02-25 11:25:47 +0530 Feb$
#
# Apache Tomcat Session Fixation Vulnerability - Feb16 (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807413");
  script_version("$Revision: 11640 $");
  script_cve_id("CVE-2015-5346");
  script_bugtraq_id(83323);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-02-25 14:42:54 +0530 (Thu, 25 Feb 2016)");
  script_name("Apache Tomcat Session Fixation Vulnerability - Feb16 (Linux)");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  and is prone to a Session Fixation Vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with
  the help of the detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to insufficient recycling of the
  requestedSessionSSL field.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to hijack web sessions by leveraging use of a requestedSessionSSL
  field for an unintended request.");

  script_tag(name:"affected", value:"Apache Tomcat 7.0.5 before 7.0.66,
  8.0.0.RC1 before 8.0.31, and 9.0.0.M1 on Linux.");

  script_tag(name:"solution", value:"Upgrade to version 7.0.66 or
  8.0.32 or 9.0.0.M3 or later.
  For updates refer to http://tomcat.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-9.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheTomcat/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 8080);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!appPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!appVer = get_app_version(cpe:CPE, port:appPort)){
  exit(0);
}

if(appVer =~ "^(7|8|9)")
{
  if(version_in_range(version:appVer, test_version:"7.0.5", test_version2:"7.0.65"))
  {
    fix = "7.0.66";
    VULN = TRUE;
  }

  if(version_in_range(version:appVer, test_version:"8.0.0.RC1", test_version2:"8.0.30"))
  {
    fix = "8.0.32";
    VULN = TRUE;
  }

  if(version_is_equal(version:appVer, test_version:"9.0.0.M1"))
  {
    fix = "9.0.0.M3";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:appVer, fixed_version:fix);
    security_message(data:report, port:appPort);
    exit(0);
  }
}
