###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_nx_os_cisco-sa-20170315-nss1.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Cisco Nexus 9000 Series Switches Remote Login Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:nx-os";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106658");
  script_cve_id("CVE-2017-3879");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_version("$Revision: 11874 $");

  script_name("Cisco Nexus 9000 Series Switches Remote Login Denial of Service Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170315-nss1");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the remote login functionality for Cisco NX-OS Software
running on Cisco Nexus 9000 Series Switches could allow an unauthenticated, remote attacker to cause a process
used for login to terminate unexpectedly and the login attempt to fail. There is no impact to user traffic
flowing through the device. The attacker could use either a Telnet or an SSH client for the remote login
attempt.");

  script_tag(name:"insight", value:"The vulnerability is due to improper handling of failed authentication
during login. An attacker could exploit this vulnerability by attempting to log in remotely to the device.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to cause a login process to terminate
unexpectedly.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-16 11:41:10 +0700 (Thu, 16 Mar 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_nx_os_version.nasl");
  script_mandatory_keys("cisco_nx_os/version", "cisco_nx_os/model", "cisco_nx_os/device");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!device = get_kb_item("cisco_nx_os/device"))
  exit(0);

if ("Nexus" >!< device)
  exit(0);

if (!nx_model = get_kb_item("cisco_nx_os/model"))
  exit(0);

if (nx_model !~ "^N9K")
  exit(0);

if (!version = get_app_version(cpe:CPE))
  exit(0);

affected = make_list(
		'7.0(3)I3(1)',
		'8.3(0)CV(0.342)',
		'8.3(0)CV(0.345)');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

