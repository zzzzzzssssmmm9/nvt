###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln_aug14_win.nasl 6724 2017-07-14 09:57:17Z teissa $
#
# Wireshark Multiple Denial of Service Vulnerabilities-01 Aug14 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804800");
  script_version("$Revision: 6724 $");
  script_cve_id("CVE-2014-5161", "CVE-2014-5162", "CVE-2014-5163", "CVE-2014-5164",
                "CVE-2014-5165");
  script_bugtraq_id(69001, 69003, 69005, 69002, 69000);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-08-07 10:00:42 +0530 (Thu, 07 Aug 2014)");
  script_name("Wireshark Multiple Denial of Service Vulnerabilities-01 Aug14 (Windows)");

  tag_summary =
"This host is installed with Wireshark and is prone to multiple denial of
service vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws exists due to,
- An error in 'dissect_log' function in plugins/irda/packet-irda.c within the
ASN.1 BER dissector.
- An error in 'read_new_line' function in wiretap/catapult_dct2000.c within the
Catapult DCT2000 dissector.
- An error in 'APN decode' functionality in epan/dissectors/packet-gtp.c and
epan/dissectors/packet-gsm_a_gm.c within the GTP and GSM Management dissectors.
- An error in 'rlc_decode_li' function in epan/dissectors/packet-rlc.c within
the RLC dissector.
- An error in 'dissect_ber_constrained_bitstring' function in
epan/dissectors/packet-ber.c within the ASN.1 BER dissector.";

  tag_impact =
"Successful exploitation will allow attackers to conduct a DoS (Denial of
Service).

Impact Level: Application";

  tag_affected =
"Wireshark version 1.10.x before 1.10.9 on Windows";

  tag_solution =
"Upgrade to Wireshark version 1.10.9 or later,
For updates refer to http://www.wireshark.org/download";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/59299");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2014-09.html");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2014-08.html");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2014-10.html");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2014-11.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
sharkVer = "";

## Get version
if(!sharkVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(sharkVer  =~ "^(1\.10)")
{
  if(version_in_range(version:sharkVer, test_version:"1.10.0", test_version2:"1.10.8"))
  {
    security_message(0);
    exit(0);
  }
}
