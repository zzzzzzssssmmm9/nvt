###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_lync_attendee_ms15-044.nasl 6170 2017-05-19 09:03:42Z teissa $
#
# Microsoft Lync Attendee Remote Code Execution Vulnerability (3057110)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805560");
  script_version("$Revision: 6170 $");
  script_cve_id("CVE-2015-1671");
  script_bugtraq_id(74490);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-19 11:03:42 +0200 (Fri, 19 May 2017) $");
  script_tag(name:"creation_date", value:"2015-05-14 12:44:26 +0530 (Thu, 14 May 2015)");
  script_name("Microsoft Lync Attendee Remote Code Execution Vulnerability (3057110)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-044.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to improper handling of
  TrueType fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  remote attacker to execute arbitrary code on the affected system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Lync Attendee 2010");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-044");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3057110");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-044");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_ms_lync_detect_win.nasl");
  script_mandatory_keys("MS/Lync/Attendee/Ver", "MS/Lync/Attendee/path");
  exit(0);
}

include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
path = "";
oglVer = "";

## For Microsoft Lync 2010 Attendee (admin level install)
## For Microsoft Lync 2010 Attendee (user level install)

## Get Installed Path
path = get_kb_item("MS/Lync/Attendee/path");
if(path)
{
  ## Get Version from Ogl.dll
  oglVer = fetch_file_version(sysPath:path, file_name:"Ogl.dll");
  if(oglVer)
  {
    if(version_in_range(version:oglVer, test_version:"4.0", test_version2:"4.0.7577.4460"))
    {
      security_message(0);
      exit(0);
    }
  }
}
