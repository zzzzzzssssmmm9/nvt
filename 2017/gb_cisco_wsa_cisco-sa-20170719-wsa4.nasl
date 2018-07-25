###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_wsa_cisco-sa-20170719-wsa4.nasl 6851 2017-08-04 07:31:24Z asteins $
#
# Cisco Web Security Appliance Static Credentials Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/h:cisco:web_security_appliance";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106974");
 script_cve_id("CVE-2017-6750");
 script_tag(name: "cvss_base", value: "5.0");
 script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:P/A:N");
 script_version("$Revision: 6851 $");

 script_name("Cisco Web Security Appliance Static Credentials Vulnerability");

 script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170719-wsa4");

 script_tag(name: "vuldetect", value: "Check the version.");

 script_tag(name: "solution", value: "See the referenced vendor advisory for a solution.");

 script_tag(name: "summary", value: "A vulnerability in AsyncOS for the Cisco Web Security Appliance (WSA) could
allow an unauthenticated, local attacker to log in to the device with the privileges of a limited user or an
unauthenticated, remote attacker to authenticate to certain areas of the web GUI.");

 script_tag(name: "insight", value: "The vulnerability is due to a user account that has a default and static
password. An attacker could exploit this vulnerability by connecting to the affected system using this default
account.");

 script_tag(name: "impact", value: "An exploit could allow the attacker to log in with the default credentials,
allowing the attacker to view the system's serial number by using the CLI or to download reports by using the web
interface.");

 script_tag(name: "qod_type", value: "package");
 script_tag(name: "solution_type", value: "VendorFix");

 script_tag(name: "last_modification", value: "$Date: 2017-08-04 09:31:24 +0200 (Fri, 04 Aug 2017) $");
 script_tag(name: "creation_date", value: "2017-07-20 14:43:16 +0700 (Thu, 20 Jul 2017)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_wsa_version.nasl");
 script_mandatory_keys("cisco_wsa/installed");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe:CPE))
  exit(0);

affected = make_list(
		'10.0.0-232',
		'10.0.0-233',
		'10.1.0',
		'10.1.0-204',
		'10.1.1-230',
		'10.1.1-234',
		'10.1.1-235',
		'10.5.0',
		'10.5.0-358');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

