# OpenVAS Vulnerability Test
# $Id: deb_2670_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2670-1 (wordpress)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
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
tag_insight = "Several vulnerabilities were identified in Wordpress, a web blogging
tool.  As the CVEs were allocated from releases announcements and
specific fixes are usually not identified, it has been decided to
upgrade the Wordpress package to the latest upstream version instead
of backporting the patches.

This means extra care should be taken when upgrading, especially when
using third-party plugins or themes, since compatibility may have been
impacted along the way.  We recommend that users check their install
before doing the upgrade.

For the stable distribution (squeeze), those problems have been fixed in
version 3.3.2+dfsg-1~squeeze1.

For the testing distribution (wheezy) and the unstable distribution
(sid), those problems have been fixed in version 3.3.2+dfsg-1.

We recommend that you upgrade your wordpress packages.";
tag_summary = "The remote host is missing an update to wordpress
announced via advisory DSA 2670-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202670-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71349");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-3122", "CVE-2011-3125", "CVE-2011-3126", "CVE-2011-3127", "CVE-2011-3128", "CVE-2011-3129", "CVE-2011-3130", "CVE-2011-4956", "CVE-2011-4957", "CVE-2012-2399", "CVE-2012-2400", "CVE-2012-2401", "CVE-2012-2402", "CVE-2012-2403", "CVE-2012-2404");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-05-31 11:44:38 -0400 (Thu, 31 May 2012)");
 script_name("Debian Security Advisory DSA 2670-1 (wordpress)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");
res = "";
report = "";
if((res = isdpkgvuln(pkg:"wordpress", ver:"3.3.2+dfsg-1~squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"wordpress-l10n", ver:"3.3.2+dfsg-1~squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"wordpress", ver:"3.3.2+dfsg-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"wordpress-l10n", ver:"3.3.2+dfsg-1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
