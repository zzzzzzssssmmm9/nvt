###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_and_compat_pack_ms15-081.nasl 5365 2017-02-20 13:46:09Z cfi $
#
# Microsoft Office Compatibility Pack Multiple Remote Code Execution Vulnerabilities (3080790)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805093");
  script_version("$Revision: 5365 $");
  script_cve_id("CVE-2015-2468");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 14:46:09 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2015-08-12 17:20:00 +0530 (Wed, 12 Aug 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Compatibility Pack Multiple Remote Code Execution Vulnerabilities (3080790)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-081.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Flaws are due to improper handling of files
  in the memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user and
  to perform actions in the security context of the current user.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office Compatibility Pack Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link, https://technet.microsoft.com/en-us/security/bulletin/ms15-081");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/2986254");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS15-081");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordCnv/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

# Variable Initialization
wordcnvVer = "";
path = "";
sysVer = "";

## Check for Office Version 2007 with compatibility pack
wordcnvVer = get_kb_item("SMB/Office/WordCnv/Version");
if(wordcnvVer && wordcnvVer =~ "^12.*")
{
  # Office Word Converter
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                              item:"ProgramFilesDir");
  if(path)
  {
    sysVer = fetch_file_version(sysPath:path + "\Microsoft Office\Office12", file_name:"Wordcnv.dll");
    if(sysVer)
    {
      ## Check for Office Version 2007 with compatibility pack version 12.0 < 12.0.6727.5000
      if(version_in_range(version:sysVer, test_version:"12.0", test_version2:"12.0.6727.4999"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}
