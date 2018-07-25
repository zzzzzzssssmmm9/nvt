###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mongodb_nativehelper_dos_vuln.nasl 7548 2017-10-24 12:06:02Z cfischer $
#
# MongoDB nativeHelper Denial of Service Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

CPE = "cpe:/a:mongodb:mongodb";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803951");
  script_version("$Revision: 7548 $");
  script_cve_id("CVE-2013-1892");
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 14:06:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2013-10-07 15:50:02 +0530 (Mon, 07 Oct 2013)");
  script_name("MongoDB nativeHelper Denial of Service Vulnerability");

  script_tag(name : "summary" , value : "This host is running MongoDB and is prone
  to a denial of service vulnerability.");
 
  script_tag(name : "vuldetect" , value : "Get the installed version of MongoDB
  with the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name : "insight" , value : "An error exists in nativeHelper function
  in SpiderMonkey which fails to validate requests properly.");

  script_tag(name : "impact" , value : "Successful exploitation will allow remote
  authenticated users to cause a denial of service condition or execute arbitrary
  code via a crafted memory address in the first argument.

  Impact Level: System/Application");

  script_tag(name : "affected" , value : "MongoDB version before 2.0.9 and 2.2.x before 2.2.4 on Windows");

  script_tag(name : "solution" , value : "Upgrade to MongoDB 2.0.9 or 2.2.4 or 2.4.2 or later,
  For updates refer to http://www.mongodb.org");

  script_xref(name : "URL" , value : "http://www.mongodb.org/about/alerts");
  script_xref(name : "URL" , value : "https://jira.mongodb.org/browse/SERVER-9124");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Databases");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("gb_mongodb_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/mongodb", 27017);
  script_mandatory_keys("mongodb/installed","Host/runs_windows");
  exit(0);
}


include("version_func.inc");
include("misc_func.inc");
include("host_details.inc");

## Variable initialisation
port = "";
ver = "";

if(!port = get_app_port(cpe:CPE))exit(0);

if(!ver = get_app_version(cpe:CPE, port:port))exit(0);

## windows
if(ver =~ "(^2\.)")
{
  if(version_is_less(version: ver, test_version: "2.0.9"))
  {
    VULN = TRUE;
    fix = "2.0.9";
  }
  else if(version_in_range(version: ver, test_version:"2.2.0", test_version2:"2.2.3"))
  {
    VULN = TRUE;
    fix = "2.2.4";
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:ver, fixed_version:fix);
    security_message(data:report, port:port);
    exit(0);
  }
}
