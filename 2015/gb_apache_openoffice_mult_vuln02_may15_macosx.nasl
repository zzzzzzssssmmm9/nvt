###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_openoffice_mult_vuln02_may15_macosx.nasl 6207 2017-05-24 09:04:07Z teissa $
#
# Apache OpenOffice Multiple Vulnerabilities -02 May15 (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:openoffice:openoffice.org";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805611");
  script_version("$Revision: 6207 $");
  script_cve_id("CVE-2015-1774");
  script_bugtraq_id(74338);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-24 11:04:07 +0200 (Wed, 24 May 2017) $");
  script_tag(name:"creation_date", value:"2015-05-11 10:05:48 +0530 (Mon, 11 May 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Apache OpenOffice Multiple Vulnerabilities -02 May15 (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with Apache
  OpenOffice and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to an overflow condition
  in the Hangul Word Processor (HWP) filter that is triggered as user-supplied
  input is not properly validated");

  script_tag(name: "impact" , value:"Successful exploitation will allow a
  remote attacker to cause a denial of service or possibly execute arbitrary
  code via a crafted HWP document access.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Apache OpenOffice before 4.1.2 on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to Apache OpenOffice version
  4.1.2 or later, For updates refer to http://www.openoffice.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1030755");
  script_xref(name : "URL" , value : "http://www.openoffice.org/security/cves/CVE-2015-1774.html");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_openoffice_detect_macosx.nasl");
  script_mandatory_keys("OpenOffice/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
openoffcVer = "";
report = "";

## Get version
## CPE is changed for newer versions of OpenOffice
if(!openoffcVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less_equal(version:openoffcVer, test_version:"4.1.1"))
{
  report = 'Installed version: ' + openoffcVer + '\n' +
           'Fixed version:     ' + "4.1.2" + '\n';
  security_message(data:report);
  exit(0);
}
