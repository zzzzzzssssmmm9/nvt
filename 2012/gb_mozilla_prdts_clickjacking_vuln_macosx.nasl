###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_clickjacking_vuln_macosx.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# Mozilla Products Certificate Page Clickjacking Vulnerability (Mac OS X)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Upgrade to Mozilla Firefox version 14.0 or ESR version 10.0.6 or later,
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to SeaMonkey version to 2.11 or later,
  http://www.mozilla.org/projects/seamonkey/

  Upgrade to Thunderbird version to 14.0 or ESR 10.0.6 or later,
  http://www.mozilla.org/en-US/thunderbird/";

tag_impact = "Successful exploitation could allow attackers to gain sensitive information
  or bypass certain security restrictions.
  Impact Level: Application";
tag_affected = "SeaMonkey version before 2.10
  Thunderbird version 5.0 through 12.0
  Mozilla Firefox version 4.x through 12.0
  Thunderbird ESR version 10.x before 10.0.6
  Mozilla Firefox ESR version 10.x before 10.0.6 on Mac OS X";
tag_insight = "The certificate warning functionality in
  browser/components/certerror/content/aboutCertError.xhtml fails to handle
  attempted clickjacking of the 'about:certerror' page, allowing
  man-in-the-middle attackers to trick users into adding an unintended
  exception via an IFRAME element";
tag_summary = "This host is installed with Mozilla firefox/thunderbird/seamonkey and is
  prone to clickjacking vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802894");
  script_version("$Revision: 9352 $");
  script_cve_id("CVE-2012-1964");
  script_bugtraq_id(54581);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-23 18:40:44 +0530 (Mon, 23 Jul 2012)");
  script_name("Mozilla Products Certificate Page Clickjacking Vulnerability (Mac OS X)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/49965");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1027256");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1027257");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-54.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Mac/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Firefox Check
ffVer = "";
ffVer = get_kb_item("Mozilla/Firefox/MacOSX/Version");

if(ffVer)
{
  # Grep for Firefox version
  if(version_in_range(version:ffVer, test_version:"4.0", test_version2:"10.0.5")||
     version_in_range(version:ffVer, test_version:"11.0", test_version2:"12.0"))
  {
    security_message(0);
    exit(0);
  }
}

# SeaMonkey Check
seaVer = "";
seaVer = get_kb_item("SeaMonkey/MacOSX/Version");

if(seaVer)
{
  # Grep for SeaMonkey version
  if(version_is_less(version:seaVer, test_version:"2.10"))
  {
    security_message(0);
    exit(0);
  }
}

# Thunderbird Check
tbVer = "";
tbVer = get_kb_item("ThunderBird/MacOSX/Version");

if(tbVer)
{
  # Grep for Thunderbird version
  if(version_in_range(version:tbVer, test_version:"5.0", test_version2:"10.0.5")||
     version_in_range(version:tbVer, test_version:"11.0", test_version2:"12.0"))
  {
    security_message(0);
    exit(0);
  }
}
