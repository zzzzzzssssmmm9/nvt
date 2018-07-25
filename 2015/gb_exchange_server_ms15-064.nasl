###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_exchange_server_ms15-064.nasl 6125 2017-05-15 09:03:42Z teissa $
#
# Microsoft Exchange Server Privilege Escalation Vulnerability (3062157)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:microsoft:exchange_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805198");
  script_version("$Revision: 6125 $");
  script_cve_id("CVE-2015-1764", "CVE-2015-1771", "CVE-2015-2359");
  script_bugtraq_id(75007, 75011, 75013);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-15 11:03:42 +0200 (Mon, 15 May 2017) $");
  script_tag(name:"creation_date", value:"2015-06-10 10:26:35 +0530 (Wed, 10 Jun 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Exchange Server Privilege Escalation Vulnerability (3062157)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-064.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"Flaw is due to Microsoft Exchange web
  applications when Exchange does not properly manage same-origin policy.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to scan and attack systems behind a firewall that are normally
  inaccessible from the outside world, enumerate and attack services that are
  running on these host systems and exploit host-based authentication services.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Microsoft Exchange Server 2013 SP1
  and Microsoft Exchange Server 2013 Cumulative Update 8");

  script_tag(name: "solution" , value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  link, https://technet.microsoft.com/library/security/MS15-064");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3062157");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-064");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_exchange_server_detect.nasl");
  script_mandatory_keys("MS/Exchange/Server/Ver");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variable Initialization
ExVer = "";
dllVer = "";
path = "";

## Get the installed path
exchangePath = get_app_location(cpe:CPE);
if(!exchangePath || "Could not find the install location" >< exchangePath){
  exit(0);
}

## Get Version from ExSetup.exe file version
exeVer = fetch_file_version(sysPath:exchangePath, file_name:"Bin\ExSetup.exe");
if(!exeVer){
  exit(0);
}

if(version_in_range(version:exeVer, test_version:"15.0", test_version2:"15.0.847.40"))
{
  security_message(0);
  exit(0);
}