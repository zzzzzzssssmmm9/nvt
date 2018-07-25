##############################################################################
# OpenVAS Vulnerability Test
# $Id: policy_cisco_ios_compliance_ok.nasl 10530 2018-07-17 14:15:42Z asteins $
#
# Cisco IOS Compliance Check: Passes
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106432");
  script_version("$Revision: 10530 $");
  script_tag(name: "last_modification", value: "$Date: 2018-07-17 16:15:42 +0200 (Tue, 17 Jul 2018) $");
  script_tag(name: "creation_date", value: "2017-01-11 10:55:08 +0700 (Wed, 11 Jan 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name: "qod", value: "98");

  script_name("Cisco IOS Compliance Check: Passes");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("Policy/policy_cisco_ios_compliance.nasl");
  script_mandatory_keys("policy/cisco_ios_compliance/passed");

  script_tag(name: "summary", value: "Lists all the Cisco IOS Compliance Policy Check which passed it.");

  exit(0);
}

passed = get_kb_item("policy/cisco_ios_compliance/passed");

if (passed) {
  passed = split(passed, keep: FALSE);

  report = max_index(passed) + " Checks passed:\n\n";

  foreach line (passed) {
    entry = split(line, sep: "||", keep: FALSE);
    report += "Titel:           " + entry[0] + "\n";
    report += "Description:     " + entry[1] + "\n";
    report += "Regex Check:     " + entry[2] + "\n";
    report += "Must be present: " + entry[3] + "\n\n";
  }

  log_message(data: report, port: 0);
}

exit(0);
