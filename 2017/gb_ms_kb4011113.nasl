###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011113.nasl 9313 2018-04-05 06:23:26Z cfischer $
#
# Microsoft SharePoint Server 2013 Service Pack 1 Elevation of Privilege Vulnerability (KB4011113)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811662");
  script_version("$Revision: 9313 $");
  script_cve_id("CVE-2017-8629");
  script_bugtraq_id(100725);
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 08:23:26 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2017-09-13 08:41:16 +0530 (Wed, 13 Sep 2017)");
  script_name("Microsoft SharePoint Server 2013 Service Pack 1 Elevation of Privilege Vulnerability (KB4011113)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011113");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to Microsoft SharePoint
  Server does not properly sanitize a specially crafted web request to an
  affected SharePoint server.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  authenticated attacker to exploit the vulnerability by sending a specially
  crafted request to an affected SharePoint server. The attacker who successfully
  exploited the vulnerability could then perform cross-site scripting attacks on
  affected systems and run script in the security context of the current user.
  These attacks could allow the attacker to read content that the attacker is not
  authorized to read, use the victim's identity to take actions on the SharePoint
  site on behalf of the user, such as change permissions and delete content, and
  inject malicious content in the browser of the user.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft SharePoint Server 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4011113");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4011113");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_mandatory_keys("MS/SharePoint/Server/Ver");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if( ! infos = get_app_version_and_location( cpe:"cpe:/a:microsoft:sharepoint_server", exit_no_version:TRUE ) ) exit( 0 );
shareVer = infos['version'];
if(!shareVer || !(shareVer =~ "^15\.")){
  exit(0);
}

## Get path for 'microsoft.office.server.native.dll'
path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Office15.OSERVER",
                         item:"InstallLocation");
if(path)
{
  path = path + "\15.0\WebServices\ConversionServices";

  ## Get version from 'microsoft.office.server.native.dll'
  dllVer = fetch_file_version(sysPath:path, file_name:"microsoft.office.server.native.dll");
  if(dllVer && dllVer =~ "^15\.")
  {
    if(version_is_less(version:dllVer, test_version:"15.0.4919.1000"))
    {
      report = 'File checked:     ' +  path + "\microsoft.office.server.native.dll"+ '\n' +
               'File version:     ' +  dllVer  + '\n' +
               'Vulnerable range: ' +  "15.0 - 15.0.4919.0999" + '\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}

exit(99);
