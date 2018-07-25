#
#VID 14a6f516-502f-11e0-b448-bbfa2731f9c7
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 14a6f516-502f-11e0-b448-bbfa2731f9c7
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_insight = "The following packages are affected:
   postfix
   postfix-base
   postfix-current
   postfix-current-base

CVE-2011-0411
The STARTTLS implementation in Postfix 2.4.x before 2.4.16, 2.5.x
before 2.5.12, 2.6.x before 2.6.9, and 2.7.x before 2.7.3 does not
properly restrict I/O buffering, which allows man-in-the-middle
attackers to insert commands into encrypted SMTP sessions by sending a
cleartext command that is processed after TLS is in place, related to
a 'plaintext command injection' attack.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.postfix.org/CVE-2011-0411.html
http://secunia.com/advisories/43646/
http://www.vuxml.org/freebsd/14a6f516-502f-11e0-b448-bbfa2731f9c7.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.69363");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-05-12 19:21:50 +0200 (Thu, 12 May 2011)");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2011-0411");
 script_name("FreeBSD Ports: postfix, postfix-base");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");

txt = "";
vuln = 0;
bver = portver(pkg:"postfix");
if(!isnull(bver) && revcomp(a:bver, b:"2.7.*,1")>=0 && revcomp(a:bver, b:"2.7.3,1")<0) {
    txt += 'Package postfix version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"2.6.*,1")>=0 && revcomp(a:bver, b:"2.6.9,1")<0) {
    txt += 'Package postfix version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"2.5.*,2")>=0 && revcomp(a:bver, b:"2.5.12,2")<0) {
    txt += 'Package postfix version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"2.4.*,1")>=0 && revcomp(a:bver, b:"2.4.16,1")<0) {
    txt += 'Package postfix version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"postfix-base");
if(!isnull(bver) && revcomp(a:bver, b:"2.7.*,1")>=0 && revcomp(a:bver, b:"2.7.3,1")<0) {
    txt += 'Package postfix-base version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"2.6.*,1")>=0 && revcomp(a:bver, b:"2.6.9,1")<0) {
    txt += 'Package postfix-base version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"2.5.*,2")>=0 && revcomp(a:bver, b:"2.5.12,2")<0) {
    txt += 'Package postfix-base version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"2.4.*,1")>=0 && revcomp(a:bver, b:"2.4.16,1")<0) {
    txt += 'Package postfix-base version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"postfix-current");
if(!isnull(bver) && revcomp(a:bver, b:"2.9.20100120,4")<0) {
    txt += 'Package postfix-current version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"postfix-current-base");
if(!isnull(bver) && revcomp(a:bver, b:"2.9.20100120,4")<0) {
    txt += 'Package postfix-current-base version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
