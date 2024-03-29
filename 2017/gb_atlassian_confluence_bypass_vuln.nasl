###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_atlassian_confluence_bypass_vuln.nasl 11901 2018-10-15 08:47:18Z mmartin $
#
# Atlassian Confluence Access Restriction Bypass Vulnerability
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

CPE = "cpe:/a:atlassian:confluence";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106869");
  script_version("$Revision: 11901 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 10:47:18 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 09:24:05 +0700 (Wed, 14 Jun 2017)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");

  script_cve_id("CVE-2017-9505");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Atlassian Confluence Access Restriction Bypass Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_atlassian_confluence_detect.nasl");
  script_mandatory_keys("atlassian_confluence/installed");

  script_tag(name:"summary", value:"Atlassian Confluence is prone to a access restriction bypass vulnerability
using watch notifications.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Confluence does not check if a user had permission to view a page when
creating a workbox notification about new comments. An attacker who can login to Confluence could receive workbox
notifications, which contain the content of comments, for comments added to a page after they started watching it
even if they do not have permission to view the page itself.");

  script_tag(name:"affected", value:"Atlassian Confluence 4.3.0 until 6.1.1.");

  script_tag(name:"solution", value:"Update to 6.2.1 or later versions.");

  script_xref(name:"URL", value:"https://jira.atlassian.com/browse/CONFSERVER-52560");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "4.3.0", test_version2: "6.1.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "6.2.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
