###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for ImageMagick CESA-2016:0726 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882484");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-05-10 05:19:37 +0200 (Tue, 10 May 2016)");
  script_cve_id("CVE-2016-3714", "CVE-2016-3715", "CVE-2016-3716", "CVE-2016-3717", 
                "CVE-2016-3718");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for ImageMagick CESA-2016:0726 centos7 ");
  script_tag(name: "summary", value: "Check the version of ImageMagick");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "ImageMagick is an image display and 
manipulation tool for the X Window System that can read and write multiple 
image formats.

Security Fix(es):

* It was discovered that ImageMagick did not properly sanitize certain
input before passing it to the delegate functionality. A remote attacker
could create a specially crafted image that, when processed by an
application using ImageMagick or an unsuspecting user using the ImageMagick
utilities, would lead to arbitrary execution of shell commands with the
privileges of the user running the application. (CVE-2016-3714)

* It was discovered that certain ImageMagick coders and pseudo-protocols
did not properly prevent security sensitive operations when processing
specially crafted images. A remote attacker could create a specially
crafted image that, when processed by an application using ImageMagick or
an unsuspecting user using the ImageMagick utilities, would allow the
attacker to delete, move, or disclose the contents of arbitrary files.
(CVE-2016-3715, CVE-2016-3716, CVE-2016-3717)

* A server-side request forgery flaw was discovered in the way ImageMagick
processed certain images. A remote attacker could exploit this flaw to
mislead an application using ImageMagick or an unsuspecting user using the
ImageMagick utilities into, for example, performing HTTP(S) requests or
opening FTP sessions via specially crafted images. (CVE-2016-3718)

Note: This update contains an updated /etc/ImageMagick/policy.xml file that
disables the EPHEMERAL, HTTPS, HTTP, URL, FTP, MVG, MSL, TEXT, and LABEL
coders. If you experience any problems after the update, it may be
necessary to manually adjust the policy.xml file to match your
requirements. Please take additional precautions to ensure that your
applications using the ImageMagick library do not process malicious or
untrusted files before doing so.
");
  script_tag(name: "affected", value: "ImageMagick on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:0726");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-May/021866.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"ImageMagick", rpm:"ImageMagick~6.7.8.9~13.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-c++", rpm:"ImageMagick-c++~6.7.8.9~13.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-c++-devel", rpm:"ImageMagick-c++-devel~6.7.8.9~13.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-devel", rpm:"ImageMagick-devel~6.7.8.9~13.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-doc", rpm:"ImageMagick-doc~6.7.8.9~13.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-perl", rpm:"ImageMagick-perl~6.7.8.9~13.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
