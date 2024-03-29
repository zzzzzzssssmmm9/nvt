##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_piwigo_xss_vuln.nasl 11493 2018-09-20 09:02:35Z asteins $
#
# Piwigo XSS Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.106437");
  script_version("$Revision: 11493 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 11:02:35 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-12-08 09:38:25 +0700 (Thu, 08 Dec 2016)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2016-9751");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Piwigo XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_piwigo_detect.nasl");
  script_mandatory_keys("piwigo/installed");

  script_tag(name:"summary", value:"Piwigo is prone to a cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Cross-site scripting (XSS) vulnerability in the search results front end
allows remote attackers to inject arbitrary web script or HTML via the search parameter.");

  script_tag(name:"impact", value:"An attacker may inject arbitrary web script or HTML code.");

  script_tag(name:"affected", value:"Piwigo 2.8.3");

  script_tag(name:"solution", value:"Update Piwigo to version 2.9.1 or above.");

  script_xref(name:"URL", value:"https://github.com/Piwigo/Piwigo/issues/559");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version == "2.8.3") {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.9.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
