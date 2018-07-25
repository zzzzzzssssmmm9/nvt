##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_emc_data_protection_advisor_mult_vuln.nasl 6662 2017-07-11 09:49:16Z ckuersteiner $
#
# EMC Data Protection Advisor Multiple Vulnerabilities
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
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:emc:data_protection_advisor";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106939");
  script_version("$Revision: 6662 $");
  script_tag(name: "last_modification", value: "$Date: 2017-07-11 11:49:16 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name: "creation_date", value: "2017-07-11 15:10:44 +0700 (Tue, 11 Jul 2017)");
  script_tag(name: "cvss_base", value: "6.8");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:S/C:C/I:N/A:N");

  script_cve_id("CVE-2017-8002", "CVE-2017-8003");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("EMC Data Protection Advisor Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_emc_data_protection_advisor_detect.nasl");
  script_mandatory_keys("emc_data_protection_advisor/installed");

  script_tag(name: "summary", value: "EMC Data Protection Advisor is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "EMC Data Protection Advisor is prone to multiple vulnerabilities:

- Multiple Blind SQL Injection Vulnerabilities (CVE-2017-8002)

- Path Traversal Vulnerability (CVE-2017-8003)");

  script_tag(name: "affected", value: "EMC Data Protection Advisor prior to version 6.4");

  script_tag(name: "solution", value: "Update to 6.4 or later versions.");

  script_xref(name: "URL", value: "http://seclists.org/fulldisclosure/2017/Jul/12");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "6.4")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "6.4");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
