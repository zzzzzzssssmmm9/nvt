###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_cfnetwork_background_dos_vuln.nasl 8447 2018-01-17 16:12:19Z teissa $
#
# Apple Safari 'background' Remote Denial Of Service Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will let the attacker crash the affected browser,
  resulting in a denial of service condition and can cause other attacks.
  Impact Level: Application";
tag_affected = "Apple Safari version 4.0.3 (4.31.9.1) and 4.0.4(5.31.21.10)";
tag_insight = "The flaw exists due to error in 'cfnetwork.dll' file in CFNetwork when processing
  'BACKGROUND' attribute of a 'BODY' element via a long string.";
tag_solution = "Upgrade to  Apple Safari version 4.0.5 or later,
  For updates refer to http://www.apple.com/support/downloads";
tag_summary = "This host is installed with Apple Safari Web Browser and is prone to
  to Denial of Service vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800485");
  script_version("$Revision: 8447 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-17 17:12:19 +0100 (Wed, 17 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-03-05 10:09:57 +0100 (Fri, 05 Mar 2010)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2010-0924");
  script_bugtraq_id(38447);
  script_name("Apple Safari 'background' Remote Denial Of Service Vulnerability");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/38447");
  script_xref(name : "URL" , value : "http://nobytes.com/exploits/Safari_4.0.4_background_DoS_pl.txt");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_apple_safari_detect_win_900003.nasl");
  script_require_keys("AppleSafari/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

function find_version(filepath)
{
  share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:filepath);
  file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:filepath);
  dllVer = GetVer(file:file, share:share);
  return dllVer;
}

safariVer = get_kb_item("AppleSafari/Version");
if(!safariVer){
  exit(0);
}

# Check for Apple Safari Version 4.0.4(5.31.21.10) and 4.0.3 (4.31.9.1)
if(version_is_equal(version:safariVer, test_version:"4.31.9.1") ||
   version_is_equal(version:safariVer, test_version:"5.31.21.10"))
{
  key = "SOFTWARE\Apple Computer, Inc.\Safari";
  asFile = registry_get_sz(item:"BrowserExe", key:key);
  if(asFile)
  {
    exeVer = find_version(filepath:asFile);
    if(!isnull(exeVer))
    {
      # Check for Safari.exe Version 5.31.21.10
      if(version_is_equal(version:exeVer, test_version:"5.31.21.10"))
      {
        dllVer = find_version(filepath: asFile -"Safari.exe" + "cfnetwork.dll");
        if(isnull(dllVer))
        {
          dllVer = find_version(filepath:asFile - "\Safari\Safari.exe" +
                   "\Common Files\Apple\Apple Application Support\cfnetwork.dll");
        }

        if(!isnull(dllVer))
        {
          # Check for cfnetwork.dll Version 1.450.5.0
          if(version_is_equal(version:dllVer, test_version:"1.450.5.0")){
            security_message(0);
          }
        }
      }
    }
  }
}
