###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_firepower_management_center_cisco-sa-20170215-fpmc.nasl 5441 2017-02-28 08:41:33Z cfi $
#
# Cisco Firepower Management Center Web Framework Cross-Site Scripting Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:cisco:firepower_management_center";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106601");
 script_cve_id("CVE-2017-3847");
 script_tag(name:"cvss_base", value:"3.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
 script_version("$Revision: 5441 $");

 script_name("Cisco Firepower Management Center Web Framework Cross-Site Scripting Vulnerability");

 script_xref(name: "URL", value: "https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170215-fpmc");

 script_tag(name: "vuldetect", value: "Check the version.");

 script_tag(name: "solution", value: "See the referenced vendor advisory for a solution.");

 script_tag(name: "summary", value: "A vulnerability in the web framework of Cisco Firepower Management Center
could allow an authenticated, remote attacker to conduct a cross-site scripting (XSS) attack against a user of
the web interface.");

 script_tag(name: "insight", value: "The vulnerability occurs because the affected software fails to perform
sufficient validation and sanitization of user-supplied input when processing crafted URLs. An authenticated,
remote attacker could exploit the vulnerability by convincing a user to follow a malicious link.");

 script_tag(name: "impact", value: "Successful exploitation could allow the attacker to execute arbitrary script
code in the context of the affected site and allow the attacker to access sensitive browser-based information.");

 script_tag(name: "qod_type", value: "package");
 script_tag(name: "solution_type", value: "VendorFix");

 script_tag(name: "last_modification", value: "$Date: 2017-02-28 09:41:33 +0100 (Tue, 28 Feb 2017) $");
 script_tag(name: "creation_date", value: "2017-02-16 13:52:09 +0700 (Thu, 16 Feb 2017)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_firepower_management_center_version.nasl");
 script_mandatory_keys("cisco_firepower_management_center/version");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE))
  exit(0);

if (version == "6.2.1") {
  report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);

