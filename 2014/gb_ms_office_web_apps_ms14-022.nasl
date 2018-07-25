###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_web_apps_ms14-022.nasl 9319 2018-04-05 08:03:12Z cfischer $
#
# Microsoft Office Web Apps Multiple Vulnerabilities (2952166)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:microsoft:office_web_apps";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804582");
  script_version("$Revision: 9319 $");
  script_cve_id("CVE-2014-0251", "CVE-2014-1754", "CVE-2014-1813");
  script_bugtraq_id(67283, 67288, 67290);
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 10:03:12 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-05-14 13:45:31 +0530 (Wed, 14 May 2014)");
  script_name("Microsoft Office Web Apps Multiple Vulnerabilities (2952166)");

  tag_summary = "This host is missing an critical security update according to Microsoft
Bulletin MS14-022.";

  tag_vuldetect = "Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight = "Flaws is due to multiple unspecified components when handling page content.";

  tag_impact = "Successful exploitation will allow remote attackers to execute the arbitrary
code and compromise a vulnerable system.

Impact Level: System/Application ";

  tag_affected = "Microsoft Web Applications 2010 Service Pack 2 and prior,

Microsoft Web Applications 2013 Service Pack 1 and prior.";

  tag_solution = "Run Windows Update and update the listed hotfixes or download and
update mentioned hotfixes in the advisory from the below link,
http://technet.microsoft.com/en-us/security/bulletin/ms14-022";

  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/57834");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/ms14-022");
  script_category(ACT_GATHER_INFO);
  script_family("Windows : Microsoft Bulletins");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_ms_office_web_apps_detect.nasl");
  script_mandatory_keys("MS/Office/Web/Apps/Ver");
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );
webappVer = infos['version'];
path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

if(webappVer =~ "^14\..*")
{
  ## Microsoft Office Web Apps 2010
  dllVer = fetch_file_version(sysPath:path,
           file_name:"\14.0\WebServices\ConversionService\Bin\Converter\sword.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7123.5000"))
    {
      security_message(0);
      exit(0);
    }
  }
}

## Microsoft Office Web Apps 2013
if(webappVer =~ "^15\..*")
{
  path = path + "\PPTConversionService\bin\Converter\";

  dllVer = fetch_file_version(sysPath:path, file_name:"msoserver.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4615.999"))
    {
      security_message(0);
      exit(0);
    }
  }
}

exit(99);