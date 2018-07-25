# OpenVAS Vulnerability Test
# $Id: deb_2282_1.nasl 9351 2018-04-06 07:05:43Z cfischer $
# Description: Auto-generated from advisory DSA 2282-1 (qemu-kvm)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
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
tag_insight = "Two vulnerabilities have been discovered in KVM, a solution for full
virtualization on x86 hardware:

CVE-2011-2212

Nelson Elhage discovered a buffer overflow in the virtio subsystem,
which could lead to denial of service or privilege escalation.

CVE-2011-2527

Andrew Griffiths discovered that group privileges were
insufficiently dropped when started with -runas option, resulting
in privilege escalation.

For the stable distribution (squeeze), this problem has been fixed in
version 0.12.5+dfsg-5+squeeze6.

For the unstable distribution (sid), this problem has been fixed in
version 0.14.1+dfsg-3.

We recommend that you upgrade your qemu-kvm packages.";
tag_summary = "The remote host is missing an update to qemu-kvm
announced via advisory DSA 2282-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202282-1";


if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.70056");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-08-07 17:37:07 +0200 (Sun, 07 Aug 2011)");
 script_cve_id("CVE-2011-2212", "CVE-2011-2527");
 script_tag(name:"cvss_base", value:"7.4");
 script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:S/C:C/I:C/A:C");
 script_name("Debian Security Advisory DSA 2282-1 (qemu-kvm)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
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
if ((res = isdpkgvuln(pkg:"kvm", ver:"1:0.12.5+dfsg-5+squeeze6", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-kvm", ver:"0.12.5+dfsg-5+squeeze6", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-kvm-dbg", ver:"0.12.5+dfsg-5+squeeze6", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
