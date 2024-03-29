##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ametys_cms_pass_reset_vuln.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Ametys CMS Unauthenticated Password Reset Vulnerability
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
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

CPE = "cpe:/a:ametys:cms";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107257");
  script_version("$Revision: 11863 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-13 13:29:03 +0200 (Mon, 13 Nov 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Ametys CMS Unauthenticated Password Reset Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ametys_cms_detect.nasl");
  script_mandatory_keys("ametys/detected");

  script_tag(name:"summary", value:"Ametys CMS is prone to an unauthenticated password reset vulnerability.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"impact", value:"Unauthenticated user can perform administrative operations without properly authorization.");

  script_tag(name:"affected", value:"Ametys CMS prior to 4.0.3");

  script_tag(name:"solution", value:"Update to version 4.0.3 or later.");

  script_xref(name:"URL", value:"https://blogs.securiteam.com/index.php/archives/3517");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!Port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: Port))
  exit(0);

if (version_is_less(version: version, test_version: "4.0.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.0.3");
  security_message(port: Port, data: report);
  exit(0);
}

exit(99);
