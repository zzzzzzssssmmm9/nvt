###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hp_ux_HPSBUX02645.nasl 11739 2018-10-04 07:49:31Z cfischer $
#
# HP-UX Update for Apache Web Server HPSBUX02645
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

if(description)
{
  script_xref(name:"URL", value:"http://www11.itrc.hp.com/service/cki/docDisplay.do?docId=emr_na-c02752210");
  script_oid("1.3.6.1.4.1.25623.1.0.835253");
  script_version("$Revision: 11739 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-04 09:49:31 +0200 (Thu, 04 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-05-05 07:14:22 +0200 (Thu, 05 May 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name:"HPSBUX", value:"02645");
  script_cve_id("CVE-2009-3560", "CVE-2009-3720", "CVE-2010-1623", "CVE-2010-3718", "CVE-2010-4476", "CVE-2011-0013");
  script_name("HP-UX Update for Apache Web Server HPSBUX02645");
  script_tag(name:"summary", value:"The remote host is missing an update for the Apache Web Server package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("HP-UX Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/hp_hp-ux", "ssh/login/hp_pkgrev", re:"ssh/login/release=HPUX(11\.31|11\.23|11\.11)");

  script_tag(name:"impact", value:"Remote information disclosure, cross-site scripting (XSS) or Denial of Service (DoS).");

  script_tag(name:"affected", value:"Apache Web Server on HP-UX B.11.23, B.11.31 running HP-UX Apache Web Server Suite v3.14 or
  earlier HP-UX B.11.11, B.11.23, B.11.31 running HP-UX Apache Web Server
  Suite v2.32 or earlier");

  script_tag(name:"insight", value:"Potential security vulnerabilities have been identified with HP-UX Apache
  Web Server. These vulnerabilities could be exploited remotely to disclose
  information, allow cross-site scripting (XSS), or create a Denial of Service
  (DoS). The Tomcat-based Servlet Engine is contained in the HP-UX Apache Web
  Server Suite.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-hpux.inc");

release = hpux_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "HPUX11.31")
{

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.APACHE", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.APACHE2", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.AUTH_LDAP", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.AUTH_LDAP2", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_JK", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_JK2", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_PERL", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_PERL2", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.PHP", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.PHP2", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.WEBPROXY", revision:"B.2.0.64.01", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxws22TOMCAT.TOMCAT", revision:"B.5.5.30.04", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.APACHE", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.APACHE2", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.AUTH_LDAP", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.AUTH_LDAP2", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_JK", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_JK2", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_PERL", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_PERL2", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.PHP", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.PHP2", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.WEBPROXY", revision:"B.2.2.15.05", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxws22TOMCAT.TOMCAT", revision:"B.5.5.30.04", rls:"HPUX11.31")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "HPUX11.23")
{

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.APACHE", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.APACHE2", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.AUTH_LDAP", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.AUTH_LDAP2", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_JK", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_JK2", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_PERL", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.MOD_PERL2", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.PHP", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.PHP2", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPCH32.WEBPROXY", revision:"B.2.0.64.01", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxws22TOMCAT.TOMCAT", revision:"B.5.5.30.04", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.APACHE", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.APACHE2", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.AUTH_LDAP", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.AUTH_LDAP2", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_JK", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_JK2", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_PERL", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_PERL2", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.PHP", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.PHP2", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.WEBPROXY", revision:"B.2.2.15.05", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxws22TOMCAT.TOMCAT", revision:"B.5.5.30.04", rls:"HPUX11.23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "HPUX11.11")
{

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.APACHE", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.APACHE2", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.AUTH_LDAP", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.AUTH_LDAP2", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_JK", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_JK2", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_PERL", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.MOD_PERL2", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.PHP", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.PHP2", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxwsAPACHE.WEBPROXY", revision:"B.2.0.64.01", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = ishpuxpkgvuln(pkg:"hpuxws22TOMCAT.TOMCAT", revision:"B.5.5.30.04", rls:"HPUX11.11")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}