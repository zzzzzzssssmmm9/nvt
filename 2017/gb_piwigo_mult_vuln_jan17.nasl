##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_piwigo_mult_vuln_jan17.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Piwigo Multiple Vulnerabilities Jan17
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
  script_oid("1.3.6.1.4.1.25623.1.0.106496");
  script_version("$Revision: 11863 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-01-05 16:26:14 +0700 (Thu, 05 Jan 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2016-10105", "CVE-2016-10033", "CVE-2016-10045", "CVE-2016-10083");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Piwigo Multiple Vulnerabilities Jan17");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_piwigo_detect.nasl");
  script_mandatory_keys("piwigo/installed");

  script_tag(name:"summary", value:"Piwigo is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Piwigo is prone to multiple vulnerabilities:

  - Remote code execution in PHPMailer (CVE-2016-10033, CVE-2016-10045)

  - File Inclusion with Possible RCE (CVE-2016-10105)

  - Cross-site scripting on admin page (CVE-2016-10083)");

  script_tag(name:"impact", value:"An attacker may execute arbitrary code.");

  script_tag(name:"affected", value:"Piwigo version 2.8.4 and prior.");

  script_tag(name:"solution", value:"Update to version 2.8.5");

  script_xref(name:"URL", value:"https://github.com/Piwigo/Piwigo/issues/559");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.8.5")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.8.5");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
