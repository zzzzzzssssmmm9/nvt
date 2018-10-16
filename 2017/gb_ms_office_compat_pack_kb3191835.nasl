###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_compat_pack_kb3191835.nasl 11835 2018-10-11 08:38:49Z mmartin $
#
# Microsoft Office Compatibility Pack Remote Code Execution Vulnerability (KB3191835)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811024");
  script_version("$Revision: 11835 $");
  script_cve_id("CVE-2017-0254");
  script_bugtraq_id(98101);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:38:49 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-05-10 09:00:39 +0530 (Wed, 10 May 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Compatibility Pack Remote Code Execution Vulnerability (KB3191835)");

  script_tag(name:"summary", value:"This host is missing an important security
  update for Microsoft Office Compatibility Pack according to Microsoft KB3191835.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as the software fails to
  properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to run arbitrary code in the context of the current user. If the
  current user is logged on with administrative user rights, an attacker could
  take control of the affected system. An attacker could then install programs;
  view, change, or delete data; or create new accounts with full user rights.");

  script_tag(name:"affected", value:"Microsoft Office Compatibility Pack Service
  Pack 3 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3191835");
  script_xref(name:"URL", value:"https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2017-0254");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/Office/ComptPack/Version", "SMB/Office/WordCnv/Version");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                              item:"ProgramFilesDir");
if(!path){
  exit(0);
}

if(get_kb_item("SMB/Office/ComptPack/Version") =~ "^12\..*")
{
  wordcnvVer = get_kb_item("SMB/Office/WordCnv/Version");
  if(wordcnvVer =~ "^12.*")
  {
    offpath = path + "\Microsoft Office\Office12";
    {
      sysVer = fetch_file_version(sysPath:offpath, file_name:"Wordcnv.dll");
      if(sysVer)
      {
        if(version_in_range(version:sysVer, test_version:"12.0", test_version2:"12.0.6768.4999"))
        {
          report = 'File checked:      ' + offpath + "\Wordcnv.dll" + '\n' +
                   'File version:      ' + sysVer  + '\n' +
                   'Vulnerable range:  12.0 - 12.0.6768.4999' + '\n' ;
          security_message(data:report);
          exit(0);
        }
      }
    }
  }
}
