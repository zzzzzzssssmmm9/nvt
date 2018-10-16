###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xe_cisco-sa-20170419-energywise.nasl 11836 2018-10-11 08:56:08Z mmartin $
#
# Cisco IOS XE Software EnergyWise Denial of Service Vulnerabilities
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

CPE = "cpe:/o:cisco:ios_xe";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106777");
  script_cve_id("CVE-2017-3860", "CVE-2017-3861", "CVE-2017-3862", "CVE-2017-3863");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11836 $");

  script_name("Cisco IOS XE Software EnergyWise Denial of Service Vulnerabilities");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170419-energywise");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"Multiple vulnerabilities in the EnergyWise module of Cisco IOS XE Software
could allow an unauthenticated, remote attacker to cause a buffer overflow condition or a reload of an affected
device, leading to a denial of service (DoS) condition.");

  script_tag(name:"insight", value:"An exploit could allow the attacker to cause a buffer overflow condition or a
reload of the affected device, leading to a DoS condition.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to cause a buffer overflow condition or
a reload of the affected device, leading to a DoS condition.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:56:08 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-20 15:41:40 +0200 (Thu, 20 Apr 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_ios_xe_version.nasl");
  script_mandatory_keys("cisco_ios_xe/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE))
  exit(0);

affected = make_list(
		'3.18.1SP',
		'3.2.1SG',
		'3.2.8SG',
		'3.3.1SG',
		'3.3.1SQ',
		'3.4.1SG',
		'3.4.2SG',
		'3.4.3SG',
		'3.4.6SG',
		'3.4.8SG',
		'3.5.1E',
		'3.5.3E',
		'3.6.0E',
		'3.6.1E',
		'3.6.2E',
		'3.6.2aE',
		'3.6.4E',
		'3.6.5E',
		'3.6.5aE',
		'3.7.0E',
		'3.7.1E',
		'3.7.2E',
		'3.7.3E',
		'3.8.0E');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

