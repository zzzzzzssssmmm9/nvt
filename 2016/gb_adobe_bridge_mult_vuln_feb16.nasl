###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_bridge_mult_vuln_feb16.nasl 5712 2017-03-24 10:00:49Z teissa $
#
# Adobe Bridge CC Multiple Vulnerabilities Feb16
#
# Authors:
# Kashianth T <tkashinath@secpod.com>
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

CPE = "cpe:/a:adobe:bridge_cc";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806871");
  script_version("$Revision: 5712 $");
  script_cve_id("CVE-2016-0951", "CVE-2016-0952", "CVE-2016-0953");
  script_bugtraq_id(83114);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-24 11:00:49 +0100 (Fri, 24 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-02-15 13:37:52 +0530 (Mon, 15 Feb 2016)");
  script_name("Adobe Bridge CC Multiple Vulnerabilities Feb16");

  script_tag(name: "summary" , value:"The host is installed with Adobe Bridge
  CC and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws are due to memory
  corruption vulnerabilities.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code or cause a denial of service (memory
  corruption) via unspecified vectors.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Adobe Bridge CC before version 6.2 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Bridge CC 6.2 or later, 
  For updates refer to http://www.adobe.com/in/products/bridge.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "https://helpx.adobe.com/security/products/photoshop/apsb16-03.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_adobe_bridge_cc_detect.nasl");
  script_mandatory_keys("Adobe/Bridge/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
prodVer = "";

##Get Product Version
if(!prodVer = get_app_version(cpe:CPE)){
  exit(0);
}

##Check if Prod version is less than 6.2
if(version_is_less(version:prodVer, test_version:"6.2"))
{
  report = report_fixed_ver(installed_version:prodVer, fixed_version:"6.2");
  security_message(data:report);
  exit(0);
}
