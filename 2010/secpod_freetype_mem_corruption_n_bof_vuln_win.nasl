###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_freetype_mem_corruption_n_bof_vuln_win.nasl 8528 2018-01-25 07:57:36Z teissa $
#
# FreeType Memory Corruption and Buffer Overflow Vulnerabilities (Windows)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation may allow attackers to execute arbitrary code in the
  context of an application that uses the affected library. Failed exploitation
  attempts will likely result in denial-of-service conditions.
  Impact Level: Application";
tag_affected = "FreeType versions prior to 2.4.0";
tag_insight = "Multiple flaws are due to,
  - An error in the 'demo' programs.
  - A heap-based buffer overflow in the 'Ins_IUP function()' in 
    'truetype/ttinterp.c' and 'Mac_Read_POST_Resource()' function in
    ' base/ftobjs.c'.
  - An integer overflow in the 'gray_render_span()' function in 'smooth/ftgrays.c'
    and integer underflow in 'glyph' handling.
  - A Buffer overflow in the 'Mac_Read_POST_Resource()' function in
    'base/ftobjs.c'.
  - An error in the 'psh_glyph_find_strong_pointr()' function in 
   'pshinter/pshalgo.c'.
  when processing malformed font files,";
tag_solution = "Upgrade to FreeType version 2.4.2 or later,
  For updates refer to http://www.freetype.org/";
tag_summary = "This host is installed with FreeType and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901143");
  script_version("$Revision: 8528 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:57:36 +0100 (Thu, 25 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-09-01 09:34:36 +0200 (Wed, 01 Sep 2010)");
  script_cve_id("CVE-2010-2497", "CVE-2010-2498", "CVE-2010-2499",
                "CVE-2010-2500", "CVE-2010-2519", "CVE-2010-2520",
                "CVE-2010-2527");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("FreeType Memory Corruption and Buffer Overflow Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/1811");
  script_xref(name : "URL" , value : "http://sourceforge.net/projects/freetype/files/freetype2/2.4.0/NEWS/view");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Denial of Service");
  script_dependencies("secpod_freetype_detect_win.nasl");
  script_require_keys("FreeType/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Get FreeType Version From KB
ftVer = get_kb_item("FreeType/Win/Ver");
if(! ftVer) {
  exit(0);
}

if(ftVer != NULL)
{
  ## Check for FreeType version prior to 2.4.0
  if(version_is_less(version: ftVer, test_version: "2.4.0")){
    security_message(0);
  }
}
