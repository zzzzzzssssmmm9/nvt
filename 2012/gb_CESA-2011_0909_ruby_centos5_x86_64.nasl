###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for ruby CESA-2011:0909 centos5 x86_64
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Ruby is an extensible, interpreted, object-oriented, scripting language. It
  has features to process text files and to do system management tasks.

  A flaw was found in the way large amounts of memory were allocated on
  64-bit systems when using the BigDecimal class. A context-dependent
  attacker could use this flaw to cause memory corruption, causing a Ruby
  application that uses the BigDecimal class to crash or, possibly, execute
  arbitrary code. This issue did not affect 32-bit systems. (CVE-2011-0188)
  
  A race condition flaw was found in the remove system entries method in the
  FileUtils module. If a local user ran a Ruby script that uses this method,
  a local attacker could use this flaw to delete arbitrary files and
  directories accessible to that user via a symbolic link attack.
  (CVE-2011-1004)
  
  It was found that WEBrick (the Ruby HTTP server toolkit) did not filter
  terminal escape sequences from its log files. A remote attacker could use
  specially-crafted HTTP requests to inject terminal escape sequences into
  the WEBrick log files. If a victim viewed the log files with a terminal
  emulator, it could result in control characters being executed with the
  privileges of that user. (CVE-2009-4492)
  
  A cross-site scripting (XSS) flaw was found in the way WEBrick displayed
  error pages. A remote attacker could use this flaw to perform a cross-site
  scripting attack against victims by tricking them into visiting a
  specially-crafted URL. (CVE-2010-0541)
  
  A flaw was found in the method for translating an exception message into a
  string in the Exception class. A remote attacker could use this flaw to
  bypass safe level 4 restrictions, allowing untrusted (tainted) code to
  modify arbitrary, trusted (untainted) strings, which safe level 4
  restrictions would otherwise prevent. (CVE-2011-1005)
  
  Red Hat would like to thank Drew Yao of Apple Product Security for
  reporting the CVE-2011-0188 and CVE-2010-0541 issues.
  
  All Ruby users should upgrade to these updated packages, which contain
  backported patches to resolve these issues.";

tag_affected = "ruby on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-June/017635.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881272");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:14:41 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2009-4492", "CVE-2010-0541", "CVE-2011-0188", "CVE-2011-1004",
                "CVE-2011-1005");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:0909");
  script_name("CentOS Update for ruby CESA-2011:0909 centos5 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of ruby");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"ruby", rpm:"ruby~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-devel", rpm:"ruby-devel~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-docs", rpm:"ruby-docs~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-irb", rpm:"ruby-irb~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-libs", rpm:"ruby-libs~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-mode", rpm:"ruby-mode~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-rdoc", rpm:"ruby-rdoc~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-ri", rpm:"ruby-ri~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-tcltk", rpm:"ruby-tcltk~1.8.5~19.el5_6.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
