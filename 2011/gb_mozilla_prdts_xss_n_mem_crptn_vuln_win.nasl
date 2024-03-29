###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_xss_n_mem_crptn_vuln_win.nasl 10135 2018-06-08 11:42:28Z asteins $
#
# Mozilla Products XSS and Memory Corruption Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802518");
  script_version("$Revision: 10135 $");
  script_cve_id("CVE-2011-3650", "CVE-2011-3648");
  script_bugtraq_id(50595, 50593);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 13:42:28 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2011-11-14 13:23:08 +0530 (Mon, 14 Nov 2011)");
  script_name("Mozilla Products XSS and Memory Corruption Vulnerabilities (Windows)");

  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-49.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-47.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl",
                           "gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : "Successful exploitation will let attackers to inject arbitrary web script
  or HTML via crafted text with Shift JIS encoding and cause a denial of
  service.
  Impact Level: System/Application");
  script_tag(name : "affected" , value : "Thunderbird version prior to 3.1.16, 5.0 through 7.0
  Mozilla Firefox version prior to 3.6.24, 4.x through 7.0");
  script_tag(name : "insight" , value : "The flaws are due to
  - Error, while handling invalid sequences in the Shift-JIS encoding.
  - Crash, when using Firebug to profile a JavaScript file with many functions.");
  script_tag(name : "summary" , value : "The host is installed with Mozilla firefox/thunderbird and is prone
  to cross site scripting and memory corruption vulnerabilities.");
  script_tag(name : "solution" , value : "Upgrade to Mozilla Firefox version 8.0 or 3.6.24 or later,
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to Thunderbird version to 8.0 or 3.1.16 or later
  http://www.mozilla.org/en-US/thunderbird/");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");


ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  if(version_is_less(version:ffVer, test_version:"3.6.24") ||
     version_in_range(version:ffVer, test_version:"4.0", test_version2:"7.0"))
  {
     security_message( port: 0, data: "The target host was found to be vulnerable" );
     exit(0);
  }
}

# Thunderbird Check
tbVer = get_kb_item("Thunderbird/Win/Ver");
if(tbVer != NULL)
{
  if(version_is_less(version:tbVer, test_version:"3.1.16") ||
     version_in_range(version:ffVer, test_version:"4.0", test_version2:"7.0")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
