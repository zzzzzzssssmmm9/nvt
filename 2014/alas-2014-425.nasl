# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-425.nasl 6663 2017-07-11 09:58:05Z teissa $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.120185");
script_version("$Revision: 6663 $");
script_tag(name:"creation_date", value:"2015-09-08 13:19:27 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-11 11:58:05 +0200 (Tue, 11 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2014-425");
script_tag(name: "insight", value: "The Server.verify_request function in SimpleGeo python-oauth2 does not check the nonce, which allows remote attackers to perform replay attacks via a signed URL. The (1) make_nonce, (2) generate_nonce, and (3) generate_verifier functions in SimpleGeo python-oauth2 uses weak random numbers to generate nonces, which makes it easier for remote attackers to guess the nonce via a brute force attack."); 
script_tag(name : "solution", value : "Run yum update python-oauth2 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-425.html");
script_cve_id("CVE-2013-4346", "CVE-2013-4347");
script_tag(name:"cvss_base", value:"5.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"python-oauth2", rpm:"python-oauth2~1.5.211~7.1.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
