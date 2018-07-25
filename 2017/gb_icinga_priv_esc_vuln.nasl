##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_icinga_priv_esc_vuln.nasl 9338 2018-04-06 02:57:01Z ckuersteiner $
#
# Icinga Privilege Escalation Vulnerability
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

CPE = "cpe:/a:icinga:icinga";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140595");
  script_version("$Revision: 9338 $");
  script_tag(name: "last_modification", value: "$Date: 2018-04-06 04:57:01 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name: "creation_date", value: "2017-12-12 10:33:48 +0700 (Tue, 12 Dec 2017)");
  script_tag(name: "cvss_base", value: "4.6");
  script_tag(name: "cvss_base_vector", value: "AV:L/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2017-16882");

  script_tag(name: "qod_type", value: "remote_banner_unreliable");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Icinga Privilege Escalation Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("sw_icinga_detect.nasl");
  script_mandatory_keys("icinga/installed");

  script_tag(name: "summary", value: "Icinga is prone to a local privilege escalation vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "Icinga Core through 1.14.0 initially executes bin/icinga as root but
supports configuration options in which this file is owned by a non-root account (and similarly can have
etc/icinga.cfg owned by a non-root account), which allows local users to gain privileges by leveraging access to
this non-root account.");

  script_tag(name: "affected", value: "Icinga 1.14.0 and prior.");

  script_tag(name: "solution", value: "Update to version 1.14.1 or later.");

  script_xref(name: "URL", value: "https://github.com/Icinga/icinga-core/issues/1601");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "1.14.0")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "1.14.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
