###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fortiweb_FG-IR-14-012.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# FortiOS: FortiWeb Cross-Site Scripting Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:fortinet:fortiweb";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105201");
  script_bugtraq_id(68528);
  script_cve_id("CVE-2014-4738");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 11872 $");

  script_name("FortiOS: FortiWeb Cross Site Scripting Vulnerabilities");

  script_xref(name:"URL", value:"https://fortiguard.com/psirt/FG-IR-14-012");

  script_tag(name:"impact", value:"An attacker may leverage these issues to execute arbitrary script code
in the browser of an unsuspecting user in the context of the affected site. This can allow the attacker to
steal cookie-based authentication credentials and launch other attacks.");

  script_tag(name:"vuldetect", value:"Check the version");
  script_tag(name:"solution", value:"Upgrade to FortiWeb 5.2.1 or higher.");

  script_tag(name:"summary", value:"FortiWeb 5.0, 5.1 and 5.2.0 are vulnerable to multiple reflective cross-site scripting issues.
Several parameters in the web management interface URLs /user/ldap_user/check_dlg and /user/radius_user/check_dlg lack sufficient
input filtering. ");

  script_tag(name:"affected", value:"FortiWeb 5.0.x, 5.1.x and 5.2.0. ");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-02-11 12:16:13 +0100 (Wed, 11 Feb 2015)");
  script_category(ACT_GATHER_INFO);
  script_family("FortiOS Local Security Checks");
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_fortiweb_version.nasl");
  script_mandatory_keys("fortiweb/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

version = get_app_version( cpe:CPE );
if( ! version )
  version = get_kb_item("fortiweb/version");

if( ! version ) exit( 0 );

fix = "5.2.1";

if( version_is_less( version:version, test_version:fix ) )
{
  model = get_kb_item("fortiweb/model");
  if( ! isnull( model ) ) report = 'Model:             ' + model + '\n';
  report += 'Installed Version: ' + version + '\nFixed Version:     ' + fix + '\n';
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

