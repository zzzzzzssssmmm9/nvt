###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xenserver_ctx230624.nasl 8151 2017-12-18 05:00:14Z ckuersteiner $
#
# Citrix XenServer Security Update (CTX230624)
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

CPE = "cpe:/a:citrix:xenserver";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140607");
  script_version("$Revision: 8151 $");
  script_tag(name: "last_modification", value: "$Date: 2017-12-18 06:00:14 +0100 (Mon, 18 Dec 2017) $");
  script_tag(name: "creation_date", value: "2017-12-18 10:17:20 +0700 (Mon, 18 Dec 2017)");
  script_tag(name: "cvss_base", value: "6.1");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:M/C:N/I:N/A:C");

  script_tag(name: "qod_type", value: "package");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Citrix XenServer Security Update (CTX230624)");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Citrix Xenserver Local Security Checks");
  script_dependencies("gb_xenserver_version.nasl");
  script_mandatory_keys("xenserver/product_version","xenserver/patches");

  script_tag(name: "summary", value: "A security issue has been identified within Citrix XenServer that may allow
the malicious administrator of a guest VM to cause the host to crash.");

  script_tag(name: "affected", value: "XenServer versions 7.2, and 7.1.");

  script_tag(name: "solution", value: "Apply the hotfix referenced in the advisory.");

  script_xref(name: "URL", value: "https://support.citrix.com/article/CTX230624");

  exit(0);
}

include("citrix_version_func.inc");
include("host_details.inc");
include("misc_func.inc");

if (!version = get_app_version(cpe: CPE))
  exit(0);

if (!hotfixes = get_kb_item("xenserver/patches"))
  exit(0);

patches = make_array();

patches['7.2.0'] = make_list('XS72E011');
patches['7.1.0'] = make_list('XS71ECU1007');

report_if_citrix_xenserver_is_vulnerable(version: version, hotfixes: hotfixes, patches: patches);

exit(99);
