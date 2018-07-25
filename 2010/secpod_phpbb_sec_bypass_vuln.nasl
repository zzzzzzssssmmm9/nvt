###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_phpbb_sec_bypass_vuln.nasl 9332 2018-04-05 12:51:29Z cfischer $
#
# phpBB 'feed.php' Security Bypass Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:phpbb:phpbb";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902180");
  script_version("$Revision: 9332 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 14:51:29 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2010-05-25 13:56:16 +0200 (Tue, 25 May 2010)");
  script_cve_id("CVE-2010-1627");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Phorum 'feed.php' Security Bypass Vulnerability");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2010/05/16/1");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2010/05/18/6");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2010/05/18/12");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Web application abuses");
  script_dependencies("phpbb_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("phpBB/installed");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker to bypass intended access
  restrictions via unspecified attack vectors.

  Impact Level: Application");

  script_tag(name:"affected", value:"phpBB version 3.0.7 before 3.0.7-PL1");

  script_tag(name:"insight", value:"The flaw is due to error in 'feed.php', which does not properly check
  permissions for feeds.");

  script_tag(name:"solution", value:"Upgrade phpBB to 3.0.7-PL1 or later,

  For updates refer to http://www.phpbb.com/downloads/");

  script_tag(name:"summary", value:"This host is running phpBB and is prone to security bypass
  vulnerability.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( vers =~ "^3\.0\.7\.*" && version_is_less( version:vers, test_version:"3.0.7.PL1" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.0.7 PL1" );
  security_message( port:port, data:report );
  exit( 0 );
}  

exit( 99 );