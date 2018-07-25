###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_freetype_unspecified_vuln_win.nasl 8495 2018-01-23 07:57:49Z teissa $
#
# FreeType Unspecified Vulnerability (Windows)
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

tag_impact = "Successful exploitation may allows remote attackers to cause denial of
  service.
  Impact Level: Application";
tag_affected = "FreeType version 2.3.9 and other versions before 2.4.2";
tag_insight = "The flaw is due to unspecified vectors via vectors involving nested
  Standard Encoding Accented Character (aka seac) calls, related to psaux.h,
  cffgload.c, cffgload.h, and t1decode.c.";
tag_solution = "Upgrade to FreeType version 2.4.2 or later,
  For updates refer to http://www.freetype.org/";
tag_summary = "This host is installed with FreeType and is prone to unspecified
  vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901145");
  script_version("$Revision: 8495 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-23 08:57:49 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-09-01 09:34:36 +0200 (Wed, 01 Sep 2010)");
  script_cve_id("CVE-2010-3054");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("FreeType Unspecified Vulnerability (Windows)");


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
  script_xref(name : "URL" , value : "http://secunia.com/advisories/40816");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2018");
  script_xref(name : "URL" , value : "http://sourceforge.net/projects/freetype/files/freetype2/2.4.2/NEWS/view");
  exit(0);
}


include("version_func.inc");

## Get FreeType Version From KB
ftVer = get_kb_item("FreeType/Win/Ver");
if(!ftVer) {
  exit(0);
}

if(ftVer != NULL)
{
  ## Check for FreeType versions
  if(version_in_range(version: ftVer, test_version: "2.3.9", test_version2: "2.4.1")) {
     security_message(0);
  }
}
