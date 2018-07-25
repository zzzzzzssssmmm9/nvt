###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_pis_cisco-sa-20170621-piwf1.nasl 6682 2017-07-12 09:00:18Z cfischer $
#
# Cisco Prime Infrastructure Web Framework Code Cross-Site Scripting Vulnerabilities
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

CPE = "cpe:/a:cisco:prime_infrastructure";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106902");
 script_cve_id("CVE-2017-6725");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_version("$Revision: 6682 $");

 script_name("Cisco Prime Infrastructure Web Framework Code Cross-Site Scripting Vulnerabilities");

 script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170621-piwf1");

 script_tag(name: "vuldetect", value: "Check the version.");

 script_tag(name: "solution", value: "See the referenced vendor advisory for a solution.");

 script_tag(name: "summary", value: "A vulnerability in the web framework code of Cisco Prime Infrastructure
could allow an unauthenticated, remote attacker to conduct a cross-site scripting (XSS) attack against a user of
the web interface of an affected system.");

 script_tag(name: "insight", value: "The vulnerability is due to insufficient input validation of some parameters
passed to the web server. An attacker could exploit this vulnerability by convincing a user to access a malicious
link or by intercepting a user request and injecting malicious code into the request.");

 script_tag(name: "impact", value: "An exploit could allow the attacker to execute arbitrary script code in the
context of the affected site or allow the attacker to access sensitive browser-based information.");

 script_tag(name: "qod_type", value: "package");
 script_tag(name: "solution_type", value: "VendorFix");

 script_tag(name: "last_modification", value: "$Date: 2017-07-12 11:00:18 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name: "creation_date", value: "2017-06-22 14:25:23 +0700 (Thu, 22 Jun 2017)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_pis_version.nasl");
 script_mandatory_keys("cisco_pis/version");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe:CPE))
  exit(0);

if (version == '2.2.2') {
  report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);

