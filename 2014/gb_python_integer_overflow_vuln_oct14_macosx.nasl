###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_python_integer_overflow_vuln_oct14_macosx.nasl 6750 2017-07-18 09:56:47Z teissa $
#
# Python Integer Overflow Vulnerability - 01 Oct14 (Mac OS X)
#
# Authors:
# Deepmala <kdeepmala@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:python:python";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804940");
  script_version("$Revision: 6750 $");
  script_cve_id("CVE-2014-7185");
  script_bugtraq_id(70089);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-18 11:56:47 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-10-17 14:35:32 +0530 (Fri, 17 Oct 2014)");

  script_name("Python Integer Overflow Vulnerability  01 Oct14 (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with Python
  and is prone to integer overflow vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Flaw exists as the user-supplied input is
  not properly validated when handling large buffer sizes and/or offsets.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information or cause a denial
  of service.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Python 2.7.x before version 2.7.8 on
  Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to version 2.7.8 or later,
  For updates refer to https://www.python.org");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://bugs.python.org/issue2183");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/96193");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_python_detect_macosx.nasl");
  script_mandatory_keys("python/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
pythonVer = "";

## Get version
if(!pythonVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_in_range(version:pythonVer, test_version:"2.7", test_version2:"2.7.7"))
{
  security_message(0);
  exit(0);
}
