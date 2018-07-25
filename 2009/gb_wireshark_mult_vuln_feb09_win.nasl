##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_vuln_feb09_win.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Wireshark Multiple Vulnerabilities Feb-09 (Windows)
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will let the attacker cause denial of service to the
  application by crafting malicious packets.";
tag_affected = "Wireshark for Windows version 1.0.5 and prior.";
tag_insight = "Multiple flaws are due to,
  - a boundary error in the processing of NetScreen Snoop capture files.
  - format string vulnerability in wireshark through format string specifiers
    in the HOME environment variable.
  - improper handling of Tektronix K12 text capture files as demonstrated by a
    file with exactly one frame.";
tag_solution = "Upgrade to the latest version 1.0.6
  http://www.wireshark.org/download.html";
tag_summary = "This host is installed with Wireshark and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800247");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-02-20 17:40:17 +0100 (Fri, 20 Feb 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_bugtraq_id(33690);
  script_cve_id("CVE-2009-0599", "CVE-2009-0600", "CVE-2009-0601");
  script_name("Wireshark Multiple Vulnerabilities Feb-09 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/33872");
  script_xref(name : "URL" , value : "http://www.wireshark.org/security/wnpa-sec-2009-01.html");
  script_xref(name : "URL" , value : "https://bugs.wireshark.org/bugzilla/attachment.cgi?id=2590");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_require_keys("Wireshark/Win/Ver");
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

wireshark = get_kb_item("Wireshark/Win/Ver");
if(!wireshark){
  exit(0);
}

# Grep for Wireshark version 0.99.6 and prior to 1.0.6
if(version_in_range(version:wireshark, test_version:"0.99.6",
                    test_version2:"1.0.5")){
  security_message(0);
}
