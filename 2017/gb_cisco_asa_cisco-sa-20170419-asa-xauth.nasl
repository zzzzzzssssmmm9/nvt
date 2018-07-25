###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_asa_cisco-sa-20170419-asa-xauth.nasl 5986 2017-04-20 07:10:53Z ckuerste $
#
# Cisco ASA Software Internet Key Exchange Version 1 XAUTH Denial of Service Vulnerability
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

CPE = "cpe:/a:cisco:asa";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106769");
 script_cve_id("CVE-2017-6610");
 script_tag(name: "cvss_base", value: "6.8");
 script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:S/C:N/I:N/A:C");
 script_version("$Revision: 5986 $");

 script_name("Cisco ASA Software Internet Key Exchange Version 1 XAUTH Denial of Service Vulnerability");

 script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170419-asa-xauth");

 script_tag(name: "vuldetect", value: "Check the version.");

 script_tag(name: "solution", value: "See the referenced vendor advisory for a solution.");

 script_tag(name: "summary", value: "A vulnerability in the Internet Key Exchange Version 1 (IKEv1) XAUTH code of
Cisco ASA Software could allow an authenticated, remote attacker to cause a reload of an affected system.");

 script_tag(name: "insight", value: "The vulnerability is due to insufficient validation of the IKEv1 XAUTH
parameters passed during an IKEv1 negotiation. An attacker could exploit this vulnerability by sending crafted
parameters.

Only traffic directed to the affected system can be used to exploit this vulnerability. This vulnerability only
affects systems configured in routed firewall mode and in single or multiple context mode. This vulnerability can
be triggered by IPv4 or IPv6 traffic. A valid IKEv1 Phase 1 needs to be established to exploit this vulnerability,
which means that an attacker would need to have knowledge of a pre-shared key or have a valid certificate for
phase 1 authentication.");

 script_tag(name: "qod_type", value: "package");
 script_tag(name: "solution_type", value: "VendorFix");

 script_tag(name: "last_modification", value: "$Date: 2017-04-20 09:10:53 +0200 (Thu, 20 Apr 2017) $");
 script_tag(name: "creation_date", value: "2017-04-20 08:47:39 +0200 (Thu, 20 Apr 2017)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_asa_version.nasl", "gb_cisco_asa_version_snmp.nasl");
 script_mandatory_keys("cisco_asa/version");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE, nofork: TRUE))
  exit(0);

check_vers = ereg_replace(string: version, pattern: "\(([0-9.]+)\)", replace: ".\1");

affected = make_list(
		'9.0.1',
		'9.0.2',
		'9.0.2.10',
		'9.0.3',
		'9.0.3.6',
		'9.0.3.8',
		'9.0.4',
		'9.0.4.1',
		'9.0.4.17',
		'9.0.4.20',
		'9.0.4.24',
		'9.0.4.26',
		'9.0.4.29',
		'9.0.4.33',
		'9.0.4.35',
		'9.0.4.37',
		'9.0.4.40',
		'9.0.4.42',
		'9.0.4.5',
		'9.0.4.7',
		'9.1.1',
		'9.1.1.4',
		'9.1.2',
		'9.1.2.8',
		'9.1.3',
		'9.1.3.2',
		'9.1.4',
		'9.1.4.5',
		'9.1.5',
		'9.1.5.10',
		'9.1.5.12',
		'9.1.5.15',
		'9.1.5.21',
		'9.1.6',
		'9.1.6.1',
		'9.1.6.10',
		'9.1.6.4',
		'9.1.6.6',
		'9.1.6.8',
		'9.1.7.4',
		'9.1.7.6',
		'9.1.7.7',
		'9.2.0.0',
		'9.2.0.104',
		'9.2.3.1',
		'9.2.1',
		'9.2.2',
		'9.2.2.4',
		'9.2.2.7',
		'9.2.2.8',
		'9.2.3',
		'9.2.3.3',
		'9.2.3.4',
		'9.2.4',
		'9.2.4.10',
		'9.2.4.2',
		'9.2.4.4',
		'9.2.4.8',
		'9.3.1.105',
		'9.3.1.50',
		'9.3.2.100',
		'9.3.2.243',
		'9.3.1',
		'9.3.1.1',
		'9.3.2',
		'9.3.2.2',
		'9.3.3',
		'9.3.3.1',
		'9.3.3.10',
		'9.3.3.11',
		'9.3.3.2',
		'9.3.3.5',
		'9.3.3.6',
		'9.3.3.9',
		'9.4.0.115',
		'9.4.1',
		'9.4.1.1',
		'9.4.1.2',
		'9.4.1.3',
		'9.4.1.5',
		'9.4.2',
		'9.4.2.3',
		'9.4.3',
		'9.4.3.11',
		'9.4.3.12',
		'9.4.3.3',
		'9.4.3.4',
		'9.4.3.6',
		'9.4.3.8',
		'9.5.1',
		'9.5.2',
		'9.5.2.10',
		'9.5.2.14',
		'9.5.2.6',
		'9.6.0',
		'9.6.1',
		'9.6.1.3');

foreach af (affected) {
  if (check_vers == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

