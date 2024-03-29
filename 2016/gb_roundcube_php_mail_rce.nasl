###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_roundcube_php_mail_rce.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# Roundcube Webmail Remote Code Execution Vulnerability via mail()
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

CPE = 'cpe:/a:roundcube:webmail';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108023");
  script_version("$Revision: 11523 $");
  script_cve_id("CVE-2016-9920");
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-12-07 13:00:00 +0100 (Wed, 07 Dec 2016)");
  script_name("Roundcube Webmail Remote Code Execution Vulnerability via mail()");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_roundcube_detect.nasl");
  script_mandatory_keys("roundcube/installed");
  script_require_ports("Services/www", 80);

  script_tag(name:"summary", value:"This host is installed with Roundcube Webmail and is prone to
  a remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Check the version whether it is vulnerable or not.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote authenticated
  attackers to execute arbitrary code on the host.");

  script_tag(name:"affected", value:"Roundcube Webmail versions prior to 1.1.7 and 1.2.x prior to 1.2.3 if:

  - the PHP mail() function is used

  - PHP mail() is configured to use sendmail

  - PHP safe_mode is turned off");

  script_tag(name:"solution", value:"Upgrade Roundcube Webmail to 1.1.7 or 1.2.3.");

  script_xref(name:"URL", value:"https://blog.ripstech.com/2016/roundcube-command-execution-via-email/");
  script_xref(name:"URL", value:"https://roundcube.net/news/2016/11/28/updates-1.2.3-and-1.1.7-released");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"1.1.7" ) ||
    version_in_range( version:vers, test_version:"1.2.0", test_version2:"1.2.2" ) ) {
   report = report_fixed_ver( installed_version:vers, fixed_version:"1.1.7/1.2.3" );
   security_message( port:port, data:report );
   exit( 0 );
}

exit( 99 );
