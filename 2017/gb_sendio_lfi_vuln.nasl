###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sendio_lfi_vuln.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Sendio Local File Inclusion Vulnerability
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

CPE = "cpe:/a:sendio:sendio";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106999");
  script_version("$Revision: 11874 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-28 14:49:12 +0700 (Fri, 28 Jul 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2016-10399");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Sendio Local File Inclusion Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_sendio_detect.nasl");
  script_mandatory_keys("sendio/installed");

  script_tag(name:"summary", value:"Sendio is affected by a Local File Inclusion vulnerability that allows an
unauthenticated, remote attacker to read potentially sensitive system files via a specially crafted URL.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"affected", value:"Sendio version 8.2.0 and prior.");

  script_tag(name:"solution", value:"Update to version 8.2.1 or later.");

  script_xref(name:"URL", value:"https://sendio.com/support/software-release-history/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "8.2.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "8.2.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
