###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_e071e178f8_mailman_fc28.nasl 11370 2018-09-13 11:32:51Z asteins $
#
# Fedora Update for mailman FEDORA-2018-e071e178f8
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.874902");
  script_version("$Revision: 11370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-13 13:32:51 +0200 (Thu, 13 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-07 06:05:21 +0200 (Tue, 07 Aug 2018)");
  script_cve_id("CVE-2018-13796");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mailman FEDORA-2018-e071e178f8");
  script_tag(name:"summary", value:"Check the version of mailman");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Mailman is software to help manage email 
discussion lists, much like Majordomo and Smartmail. Unlike most similar products, 
Mailman gives each mailing list a webpage, and allows users to subscribe,
unsubscribe, etc. over the Web. Even the list manager can administer his or her 
list entirely from the Web. Mailman also integrates most things people want to do 
with mailing lists, including archiving, mail
 -  news gateways, and so on.

Documentation can be found in: /usr/share/doc/mailman

When the package has finished installing, you will need to perform some
additional installation steps, these are described in:
/usr/share/doc/mailman/INSTALL.REDHAT
");
  script_tag(name:"affected", value:"mailman on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-e071e178f8");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QMI7UFFD7ZLOTUTAKJZPPN6H6ME47ECQ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"mailman", rpm:"mailman~2.1.29~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
