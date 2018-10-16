###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dell_kace_k1000_sma_65029.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Dell Kace 1000 Systems Management Appliance DS-2014-001 Multiple SQL Injection Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
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

CPE = "cpe:/a:quest:kace_systems_management_appliance";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103892");
  script_bugtraq_id(65029);
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-1671");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Dell Kace 1000 Systems Management Appliance DS-2014-001 Multiple SQL Injection Vulnerabilities");

  script_xref(name:"URL", value:"http://www.baesystemsdetica.com.au/Research/Advisories/Dell-KACE-K1000-SQL-Injection-%28DS-2014-001%29");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/65029");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-01-27 17:25:18 +0100 (Mon, 27 Jan 2014)");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");

  script_dependencies("gb_quest_kace_sma_detect.nasl");
  script_mandatory_keys("quest_kace_sma/detected", "quest_kace_sma/model");
  script_require_ports("Services/www", 80);

  script_tag(name:"impact", value:"Exploiting these issues could allow an attacker to compromise the
application, access or modify data, or exploit latent vulnerabilities in the underlying database.");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"insight", value:"Dell Kace 1000 Systems Management Appliance is prone to multiple
SQL-injection vulnerabilities because it fails to sufficiently sanitize user-supplied input before using it in
an SQL query.");

  script_tag(name:"solution", value:"Updates are available.");

  script_tag(name:"summary", value:"Dell Kace 1000 Systems Management Appliance is prone to multiple SQL
injection vulnerabilities");

  script_tag(name:"affected", value:"Dell Kace 1000 Systems Management Appliance 5.4.76847 is vulnerable,
other versions may also be affected.");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

model = get_kb_item("quest_kace_sma/model");
if (model !~ "^(k|K)1000")
  exit(0);

if (!port = get_app_port(cpe: CPE))
  exit (0);

if (!vers = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: vers, test_version: "5.5")) {
  report = report_fixed_ver(installed_version: vers, fixed_version: "5.5");
  security_message(port: port, data: report);
  exit(0);
}

exit (99);
