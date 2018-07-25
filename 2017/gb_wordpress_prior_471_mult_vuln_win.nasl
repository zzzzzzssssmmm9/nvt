###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_prior_471_mult_vuln_win.nasl 7543 2017-10-24 11:02:02Z cfischer $
#
# WordPress < 4.7.1 Multiple Security Vulnerabilities (Windows)
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108047");
  script_version("$Revision: 7543 $");
  script_cve_id("CVE-2017-5493", "CVE-2017-5492", "CVE-2017-5491", "CVE-2017-5490",
  "CVE-2017-5489", "CVE-2017-5488", "CVE-2017-5487", "CVE-2016-10066");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:02:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-01-20 12:20:15 +0100 (Fri, 20 Jan 2017)");
  script_name("WordPress < 4.7.1 Multiple Security Vulnerabilities (Windows)");
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"https://wpvulndb.com/wordpresses/47");
  script_xref(name:"URL", value:"https://wordpress.org/news/2017/01/wordpress-4-7-1-security-and-maintenance-release/");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to multiple security vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to:

  - Cross-site scripting (XSS) via the plugin name or version header on update-core.php

  - Cross-site request forgery (CSRF) bypass via uploading a Flash file

  - Cross-site scripting (XSS) via theme name fallback

  - Post via email checks mail.example.com if default settings are not changed

  - Cross-site request forgery (CSRF) in the accessibility mode of widget editing

  - Weak cryptographic security for multisite activation key");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attacker to e.g. obtain sensitive information or inject arbitrary web script or HTML. 

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress versions 4.7 and earlier on Windows.");

  script_tag(name:"solution", value:"Upgrade to WordPress version 4.7.1.
  For updates refer to https://wordpress.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"4.7.1" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"4.7.1" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );
