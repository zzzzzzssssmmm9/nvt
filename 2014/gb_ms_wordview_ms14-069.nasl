###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_wordview_ms14-069.nasl 6663 2017-07-11 09:58:05Z teissa $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3009710)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805013");
  script_version("$Revision: 6663 $");
  script_cve_id("CVE-2014-6333", "CVE-2014-6334", "CVE-2014-6335");
  script_bugtraq_id(70961, 70962, 70963);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 11:58:05 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-11-12 09:00:26 +0530 (Wed, 12 Nov 2014)");

  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3009710)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS14-069.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaws are due to errors when parsing
  files.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute the arbitrary code, cause memory corruption and
  compromise the system.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Office Word Viewer 2007 SP3 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS14-069");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/59867");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/2899553");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS14-069");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variable Initailization
wordviewVer = "";

wordviewVer = get_kb_item("SMB/Office/WordView/Version");
if(wordviewVer)
{
  # Check for Wordview.exe 11.0 < 11.0.8413
  if(version_in_range(version:wordviewVer, test_version:"11.0", test_version2:"11.0.8412"))
  {
    security_message(0);
    exit(0);
  }
}
