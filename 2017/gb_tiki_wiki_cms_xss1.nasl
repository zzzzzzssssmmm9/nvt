###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tiki_wiki_cms_xss1.nasl 6746 2017-07-18 04:18:27Z ckuersteiner $
#
# Tiki Wiki CMS Groupware XSS Vulnerability
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

CPE = "cpe:/a:tiki:tikiwiki_cms/groupware";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106961");
  script_version("$Revision: 6746 $");
  script_tag(name: "last_modification", value: "$Date: 2017-07-18 06:18:27 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name: "creation_date", value: "2017-07-18 11:04:20 +0700 (Tue, 18 Jul 2017)");
  script_tag(name: "cvss_base", value: "4.3");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2017-9305");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Tiki Wiki CMS Groupware XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_tikiwiki_detect.nasl");
  script_mandatory_keys("TikiWiki/installed");

  script_tag(name: "summary", value: "lib/core/TikiFilter/PreventXss.php in Tiki Wiki CMS Groupware allows remote
attackers to bypass the XSS filter via padded zero characters, as demonstrated by an attack on
tiki-batch_send_newsletter.php.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "Tiki Wiki CMS Groupware 16.2.");

  script_tag(name: "solution", value: "Upgrade to version 17.0 or later.");

  script_xref(name: "URL", value: "https://github.com/tikiorg/tiki/commit/6c016e8f066d2f404b18eaa1af7fa0c7a9651ccd");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_equal(version: version, test_version: "16.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "17.0");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
