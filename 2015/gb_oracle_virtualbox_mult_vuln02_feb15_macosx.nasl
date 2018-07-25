###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_mult_vuln02_feb15_macosx.nasl 6243 2017-05-30 09:04:14Z teissa $
#
# Oracle Virtualbox Multiple Vulnerabilities Feb15 (Mac OS X)
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805432");
  script_version("$Revision: 6243 $");
  script_cve_id("CVE-2015-0427", "CVE-2014-6595", "CVE-2014-6590", "CVE-2014-6589",
                "CVE-2014-6588");
  script_bugtraq_id(72216, 72206, 72213, 72202, 72196);
  script_tag(name:"cvss_base", value:"3.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:N/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-30 11:04:14 +0200 (Tue, 30 May 2017) $");
  script_tag(name:"creation_date", value:"2015-02-02 10:11:39 +0530 (Mon, 02 Feb 2015)");
  script_name("Oracle Virtualbox Multiple Vulnerabilities Feb15 (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with Oracle VM
  virtualBox and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to multiple
  unspecified errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow local
  attackers to cause a DoS (Denial of Service) and disclose potentially
  sensitive information.

  Impact Level: Application");

  script_tag(name: "affected" , value:"VirtualBox versions 4.3.x before 4.3.20
  on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to Oracle VirtualBox version
  4.3.20 or later. For updates refer to https://www.virtualbox.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.scip.ch/en/?vuldb.68800");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/62524");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_family("General");
  script_dependencies("secpod_oracle_virtualbox_detect_macosx.nasl");
  script_mandatory_keys("Oracle/VirtualBox/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
virtualVer = "";

## Get version
if(!virtualVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(virtualVer =~ "^(4\.3)")
{
  ## Grep for vulnerable version
  if(version_is_less(version:virtualVer, test_version:"4.3.20"))
  {
    report = 'Installed version: ' + virtualVer + '\n' +
             'Fixed version:     ' + "4.3.20"  + '\n';
    security_message(data:report);
    exit(0);
  }
}
