###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_viewer_ms15-033.nasl 6513 2017-07-04 09:59:28Z teissa $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3048019)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805061");
  script_version("$Revision: 6513 $");
  script_cve_id("CVE-2015-1650", "CVE-2015-1649", "CVE-2015-1651");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 11:59:28 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-04-15 11:05:27 +0530 (Wed, 15 Apr 2015)");
  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3048019)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-033.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists as,
  - The Office software improperly handles objects in memory while parsing
    specially crafted Office files.
  - The Office software fails to properly handle rich text format files in
    memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user and
  to perform actions in the security context of the current user. 

  Impact Level: System/Application");

  script_tag(name:"affected", value:"
  Microsoft Word Viewer 2007 Service Pack 3 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link, https://technet.microsoft.com/en-us/security/bulletin/ms15-033");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/2965289");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/ms15-033");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");
  exit(0);
}


include("version_func.inc");

## Variable Initailization
wordviewVer = "";

wordviewVer = get_kb_item("SMB/Office/WordView/Version");
if(wordviewVer)
{
  # Check for Wordview.exe 11.0 < 11.0.8417
  if(version_in_range(version:wordviewVer, test_version:"11.0", test_version2:"11.0.8416"))
  {
    security_message(0);
    exit(0);
  }
}
