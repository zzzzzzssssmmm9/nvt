##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_piwigo_mult_vuln_jun17.nasl 6406 2017-06-22 10:42:26Z teissa $
#
# Piwigo Multiple Vulnerabilities
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

CPE = 'cpe:/a:piwigo:piwigo';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106879");
  script_version("$Revision: 6406 $");
  script_tag(name: "last_modification", value: "$Date: 2017-06-22 12:42:26 +0200 (Thu, 22 Jun 2017) $");
  script_tag(name: "creation_date", value: "2017-06-16 15:14:30 +0700 (Fri, 16 Jun 2017)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");

  script_cve_id("CVE-2017-9463", "CVE-2017-9464");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Piwigo Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_piwigo_detect.nasl");
  script_mandatory_keys("piwigo/installed");

  script_tag(name: "summary", value: "Piwigo is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "Piwigo is prone to multiple vulnerabilities:

- SQL Injection (CVE-2017-9463)

- Open Redirect (CVE-2017-9464)");

  script_tag(name: "affected", value: "Piwigo version 2.9.0 and prior.");

  script_tag(name: "solution", value: "Update to version 2.9.1 or later.");

  script_xref(name: "URL", value: "https://www.wizlynxgroup.com/security-research-advisories/vuln/WLX-2017-003");
  script_xref(name: "URL", value: "https://github.com/Piwigo/Piwigo/issues/705");
  script_xref(name: "URL", value: "https://www.wizlynxgroup.com/security-research-advisories/vuln/WLX-2017-007");
  script_xref(name: "URL", value: "https://github.com/Piwigo/Piwigo/issues/706");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.9.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.9.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
