# OpenVAS Vulnerability Test
# $Id: deb_3104.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3104-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703104");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2004-2771", "CVE-2014-7844");
    script_name("Debian Security Advisory DSA 3104-1 (bsd-mailx - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2014-12-16 00:00:00 +0100 (Tue, 16 Dec 2014)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3104.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "bsd-mailx on Debian Linux");
    script_tag(name: "insight",   value: "mailx is the traditional
command-line-mode mail user agent. Even if you don't use it, it may be
required by other programs.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 8.1.2-0.20111106cvs-1+deb7u1.

We recommend that you upgrade your bsd-mailx packages.");
    script_tag(name: "summary",   value: "It was discovered that bsd-mailx,
an implementation of the mail command, had an undocumented feature which treats
syntactically valid email addresses as shell commands to execute.

Users who need this feature can re-enable it using the expandaddr in an
appropriate mailrc file. This update also removes the obsolete -T option. An
older security vulnerability, CVE-2004-2771, had already been addressed in the
Debian's bsd-mailx package.

Note that this security update does not remove all mailx facilities for
command execution, though. Scripts which send mail to addresses obtained
from an untrusted source (such as a web form) should use the -- separator
before the email addresses (which was fixed to work properly in this update),
or they should be changed to invoke mail -t or sendmail -i -t instead, passing
the recipient addresses as part of the mail header.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"bsd-mailx", ver:"8.1.2-0.20111106cvs-1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
