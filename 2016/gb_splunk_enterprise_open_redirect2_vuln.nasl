###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_splunk_enterprise_open_redirect2_vuln.nasl 11516 2018-09-21 11:15:17Z asteins $
#
# Splunk Enterprise Open Redirect Vulnerability
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

CPE = 'cpe:/a:splunk:splunk';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106264");
  script_version("$Revision: 11516 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 13:15:17 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-09-19 11:58:34 +0700 (Mon, 19 Sep 2016)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");

  script_cve_id("CVE-2016-4857");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Splunk Enterprise Open Redirect Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_splunk_detect.nasl");
  script_mandatory_keys("Splunk/installed");

  script_tag(name:"summary", value:"Splunk Enterprise is prone an open redirect vulnerability.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Splunk Enterprise is affected by a vulnerability that could permit an
attacker to redirect a user to an attacker controlled website.");

  script_tag(name:"impact", value:"When accessing a specially crafted URL, the user may be redirected to an
arbitrary website. As a result, the user may become a victim of a phishing attack.");

  script_tag(name:"affected", value:"Splunk Enterprise 6.4.x, 6.3.x, and 6.2.x");

  script_tag(name:"solution", value:"Update to version 6.4.2, 6.3.6, 6.2.11 or later.");

  script_xref(name:"URL", value:"https://www.splunk.com/view/SP-CAAAPQM");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version =~ "^6\.4") {
  if (version_is_less(version: version, test_version: "6.4.2")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "6.4.2");
    security_message(port: port, data: report);
    exit(0);
  }
}

if (version =~ "^6\.3") {
  if (version_is_less(version: version, test_version: "6.3.6")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "6.3.6");
    security_message(port: port, data: report);
    exit(0);
  }
}


if (version =~ "^6\.2") {
  if (version_is_less(version: version, test_version: "6.2.11")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "6.2.11");
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(0);
