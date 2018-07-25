###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2013_0624_1.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# SuSE Update for NRPE openSUSE-SU-2013:0624-1 (NRPE)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850460");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-11-19 14:05:50 +0530 (Tue, 19 Nov 2013)");
  script_cve_id("CVE-2013-1362");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("SuSE Update for NRPE openSUSE-SU-2013:0624-1 (NRPE)");

  tag_insight = "
  NRPE (the Nagios Remote Plug-In Executor) allows the
  passing of $() to plugins/scripts which, if run under bash,
  will execute that shell command under a subprocess and pass
  the output as a parameter to the called script. Using this,
  it is possible to get called scripts, such as check_http,
  to execute arbitrary commands under the uid that
  NRPE/nagios is running as (typically, 'nagios').

  With this update NRPE will deny remote requests
  containing a bash command substitution.";

  tag_affected = " NRPE on openSUSE 11.4";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "openSUSE-SU", value: "2013:0624_1");
  script_tag(name: "summary" , value: "Check for the Version of NRPE");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE11.4")
{

  if ((res = isrpmvuln(pkg:"nagios-nrpe", rpm:"nagios-nrpe~2.12~25.2", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nagios-nrpe-debuginfo", rpm:"nagios-nrpe-debuginfo~2.12~25.2", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nagios-nrpe-debugsource", rpm:"nagios-nrpe-debugsource~2.12~25.2", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nagios-nrpe-doc", rpm:"nagios-nrpe-doc~2.12~25.2", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nagios-plugins-nrpe", rpm:"nagios-plugins-nrpe~2.12~25.2", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nagios-plugins-nrpe-debuginfo", rpm:"nagios-plugins-nrpe-debuginfo~2.12~25.2", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
