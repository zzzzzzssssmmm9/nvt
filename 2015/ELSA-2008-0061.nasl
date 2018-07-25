# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2008-0061.nasl 9301 2018-04-04 12:02:46Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.122587");
script_version("$Revision: 9301 $");
script_tag(name:"creation_date", value:"2015-10-08 14:48:40 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2018-04-04 14:02:46 +0200 (Wed, 04 Apr 2018) $");
script_name("Oracle Linux Local Check: ELSA-2008-0061");
script_tag(name: "insight", value: "ELSA-2008-0061 -  setroubleshoot security and bug fix update - setroubleshoot:[2.0.5-3.0.1.el5]- replace missed references to bugzilla.redhat.com with linux.oracle.com[2.0.5-3]- Resolve: bug #436564: socket.getsockopt() on ppc generates exception Fix typo in original setroubleshoot-get_credentials.patch[2.0.5-2]- Resolve: bug #437857: python error in system shutdown - Resolve: bug #436564: socket.getsockopt() on ppc generates exception[2.0.5-1]- Resolve: bug #431768: parser error in xmlParseDoc()[2.0.3-3]- Resolve: bug #429179: notification-daemon crashes when a notification is removed from the display[2.0.3-2]- remove libuser-python dependency - Related: bug #224351[2.0.2-1]- Resolve bug #428252: Problem with update/remove old version - Add code to validate xml database version, if file is incompatible it is not read, the next time the database is written it will be in the new version format. This means the database contents are not preserved across database version upgrades. - Remove postun trigger from spec file used to clear database between incompatible versions the new database version check during database read will handle this instead - bullet proof exit status in init script and rpm scriptlets - Resolve bug #247302: setroubleshoots autostart .desktop file fails to start under a KDE session - Resolve bug #376041: Cannot check setroubleshoot service status as non-root - Resolve bug #332281: remove obsolete translation - Resolve bug #344331: No description in gnome-session-properties - Resolve bug #358581: missing libuser-python dependency - Resolve bug #426586: Renaming translation po file from sr@Latn to sr@latin - Resolve bug #427260: German Translation - enhance the sealert man page[2.0.1-1]- make connection error message persist instead of timeout in browser - updated Brazilian Portuguese translation: Igor Pires Soares - implement uid,username checks - rpc methods now check for authenticated state - fix html handling of summary string - add 'named' messages to status bar, make sure all messages either timeout or are named - fix ordering of menus, resolves bug #427418 - add 'hide quiet' to browser view filtering, resolves bug #427421 - tweak siginfo text formatting[2.0.0-1]- prepare for v2 test release - Completed most work for version 2 of setroubleshoot, prepare for test release - import Dans changes from the mainline primarily allow_postfix_local_write_mail_spool plugin - escape html, fix siginfo.format_html(), siginfo.format_text() - add async-error signal - change identity to just username - make sure set_filter user validation works and reports error in browser - fix generation of line numbers and host when connected to audispd - add permissive notification, resolves bug #231334: Wording doesnt change for permissive mode - resolves bug #244345: avc path information incomplete - get the uid,gid when a client connects to the server - set_filter now verifies the filter is owned by the user, - resolves bug #288261: setroubleshoot lack of user authentication - remove filter options which werent being used - change '@' in audit data hostname to '.' - remove restart dialog resolves bug #321171: sealerts dialog after update is higly confusing - fix rpc xml arg - fix handling of host value - tweak what fields are in signature - move data items which had been in 'avc' object into siginfo - clean up siginfo format - large parts of new audit data pipeline working, checkpoint - fix duplicate xml nodes when generating xml tree - audit event can now be xml serialized - switch from using ints for audit record types to strings - avoid conversion headaches and possibility of not being able to convert a new unknown type - add logic to allow XmlSerialize to be subclassed and init_from_xml_node to be overridden - add support to xml serialize classes AuditEventID, AuditEvent, AuditRecord - use metaclass for xml class init - start adding xml support to audit data classes - Use metaclass to wrap class init - move xml serialization code from signature.py to xml_serialize.py - simplify aspect of the serialization code - add unstructured xml mapping, each xml element name has its content mapped to obj.name - modify xml serialization to be driven by xml contents - general clean up - checkpoint conversion of serialization to use metaclasses - clean up class/data specifications for XmlSerializable - add support for client rpc testing - add changelog entry - add SubProcess class to setroubleshootd in preparation to - run daemon as subprocess so we can gather results and compare them to the expected data we sent - rewrite all plugins to use new v2 audit data - add SubProcess class to setroubleshootd in preparation to run daemon as subprocess so we can gather results and compare them to the expected data we sent - add new test support: add config section 'test', add boolean 'analyze' to config test section, add class TestPluginReportReceiver which is installed if test.analyze is True, it prints analysis report. In test_setroubleshootd send AUDIT_EOE to assure sequential event processing so analysis results have same ordering as events that are sent by test_setroubleshootd - alert signatures now include host information, alerts will be grouped by host[1.10.7-1]- Fix spec file requires for opening an HTML page In configure.ac search for xdg-open and htmlview in priority order, set variable html_browser_open to the one found, in spec file require xdg-utils for fedora and htmlview for RHEL. - add 'Host' column in browser add 'Toggle Column Visibility' menu to toggle display of any column on/off - Resolves bug #310261: setroubleshoot notifications arent throttled - add support for AUDIT_EOE, end-of-event, if AUDIT_EOE immediately emit cached event. Disable timeouts used to flush events if AUDIT_EOE has been seen.[1.10.6-1]- make selinx-policy requires in spec file specific to dist tag[1.10.5-1]- update code for command line log file scanning to work with new log file scanning code introduced for the browser. - update Bulgarian translation (Doncho N. Gunchev (gunchev@gmail.com)) - update Polish translation (Piotr Drag (raven@pmail.pl)) - Resolves bug #239893: sealert wakes up very often This was caused by the use of threads and pygtks thread signal handling. The only use of threads in sealert was for log file scanning so that the UI would remain responsive during a scan. Threads in sealert have now been completely removed. Instead the scanning work is performed in a gobject idle function called from the main loop. The idle function is written as a python generator function which allows for the function to perform a small amount of work, save its execution state and return. The next time the idle function is called from the main loop it resumes execution from its last state until it decides to yield control again. This way the long running scan/analysis can be performed in small successive units of work during the time the application is otherwise idle and it does not interfere with the rest of the GUI event processing. Everything now occurs in an event loop, think of it as the applications process/thread scheduler whose event handlers execute time slices. - rewrote parts of the audit input pipeline to use generators instead of callbacks, thus permitting the logfile scanning code to yield control with more granularity. Also updated test_setroubleshootd and audisp_listen to use the new generator/yield logic. - rewrote the dialog used for scanning log files, progress bar updates are now in the dialog, the scan can be terminated part way through, errors from the scan are reported in pop-up dialog, one can only dismiss the dialog with success if the scan had been successfully run to completion, otherwise the user is only left with the option to cancel. - Relates bug #252035 bug #247469, setroubleshootd and sealert should exit if SELinux is disabled. - add utility functions escape_html() and unescape_html() - fix initial sort order in browser, track sort order in browser - modify AVC.get_path() to only return a value if the 'path' field is set, formerly it also considered the fields 'name' & 'file' which were incorrect. get_path() now also looks to see if the string begins with a slash for a fully qualified path, if not it looks to see if its a pseudo path such as 'pipe[12345]' or 'socket[12345]' and if so strips out the instance information inside the brackets and returns just the type of the pseudo path. This is done because we do not want path information in the signature to be unique for each instance of the denial. - modify the TimeStamp class to hide its internal datetime member, remove the cmp() method, the internal __cmp__ will be automatically invoked. - require selinux policy version in spec file to allow system dbus use - Resolves bug #256601: audit2allow generates incorrect syntax when comma ',' in denied list - update po i18n files - Add support for pruning database by age and size[1.10.4-1]- fix init script[1.10.3-1]- modify avc_audit.py to use new audit_data.py implementation - can listen for audit events on either /var/run/audit_events in bindary protocol mode or /var/run/audisp_events in text protocol mode[1.10.2-1]- remove all copied code from test_setroubleshootd, now we import from setroubleshoot - export ClientConnectionHandler from rpc.py as a base class. Derive SetroubleshootdClientConnectionHandler and AuditClientConnectionHandler from ClientConnectionHandler. - add audisp_listen as test program - create setroubleshoot sym link in top devel directory pointing to src so import setroubleshoot.foo if PYTHONPATH=topdir - add get_option, convert_cfg_type to config.py.in so that one can pass optional dict to override config file settings - rewrite log_init() so its easier for other programs to use it, fix the import logic concering log & config - remove log code from test_setroubleshoot, now just does import from setroubleshoot. - test_setroubleshootd can now handle audit records in both text and binary formats, can be selected by command line arg. It can now either output to clients connecting on a socket or to stdout. Can now optionally exit after N socket client connections. - remove non audit record lines from test data - remove config_init() and log_init() from package __init__.py It was the wrong place to call them, now call them when the process initializes before the first setroubleshoot imports - add parse_config_setting() and set_config() to config module - setroubleshootd now accepts -c --config command line arg - test_sectroubleshoot: add err defines & program_error exception add is_valid() tests to assure we read a valid audit record log the unrecognized line if not valid, clean up socket close() - Relates Bug #247056, update initscript to LSB standards Note: LSB initscripts in Fedora is not yet a resolved issue, the changes implemented were to add an LSB block and support the new LSB try-restart and force-reload commands. However the new /lib/lsb/init-functions are NOT currently used as this is the unstable part.[1.10.1-1]- add BuildRequires perl-XML-Parser[1.10.0-1]- move all plugins and their translations to independent package - wrap XML generation inside try/except - correct how access list is obtained in avc_auparse.py - add try/except around top level of AnalyzeThread.run so exceptions in the thread get reported and the analysis thread does not just die. - also add try/except around LogfileThread.process_logfile - add new function assure_file_ownership_permissions() - server now forces its database file permissions/ownership to be 0600 root:root - rpm now forces the servers database file permissions/ownership to be 0600 root:root - Resolves Bug #251545: Review Request: setroubleshoot-plugins - analysis plugins for setroubleshoot - clean up some other rpmlint warnings in setroubleshoot.spec - fix missing install of setroubleshoot icon and sym link to it - Resolves Bug #251551, setroubleshoot shows up in in wrong desktop menu also run desktop-file-install in rpm install - add /etc/dbus-1/system.d/setroubleshootd.conf dbus configuration file - Resolves Bug #250979, Bug #250932 Missing dependencies - Restore plugins/Makefile.am which got nuked somehow - remove dus.dbus_bindings.bus_name_has_owner(), deprecated as of F7 - wrap rpm transactions in try/except[1.9.7-1]- Resolves Bug# 241739, this bug is the lead bug for several bug reports, all consequences of the same problem, setroubleshootd/sealert when run in a non latin language environment because of incompatibilities in i18n encoding between components.[1.9.6-1]- add avc_auparse.py, now has option to use audit parsing library instead of built-in audit parsing. - fix bug in log file scanning and detail display update - Resolves Bug# 238516, python pkg directory not owned[1.9.5-1]- Update translations - Fix mislabeled file[1.9.4-1]- Remove disable_trans boolean - Check for paths in filesystem before suggesting chcon -R - Remove default to listen on local ports[1.9.3-1]- install icon in /usr/share/icons, refer to icon by name using standard API - Fix performance problems in setroubleshoot browser log file scanning - Significant rewrite of data/view management code in setroubleshoot browser. data and view now cleanly separated, can easily switch between data views while maintaining selections, view state, with proper update of status information in status area - Resolves Bug# 227806: right click context menu resets selection - Logfile scans now operate in independent thread, proper asynchronous updates of browser during scan, browser used to appear to hang - Resolved Bug# 224340: Rewrite Menu/Toobar/Popup to use UIManger instead of glade - Add toobar support - Implement GUI to edit email recipient list in setroubleshoot browser - Added user help to setroubleshoot browser - Related Bug# 224343: Fix setroubleshoot browser to respond to desktop theme changes - improve traceback error reporting in sealert - rewrite AboutDialog, replacing glade version - Resolves bug #229849 Bug# 230115, Related bug #221850: fix uuid code to resolve '_uuid_generate_random' is not defined error[1.9.2-1]- Suck in AuditMsg since audit libs are dropping support[1.9.1-1]- Split into server and gui packages[1.8.19-1]- Remove use of ctypes in uuid, which is causing bad avc messages[1.8.18-1]- Remove avc from Plugin.py[1.8.17-1]- Remove tempfile handling in util.py. Causes lots of avcs and is not used[1.8.16-1] - Resolved: Bug# 224343 sealerts 'Aditional Info:' text should be in white box - Resolved: Bug# 224336 sealert should have GtkRadioButtons in menu View - Related: bug #224351 Rewrite parts of logging support to better support changing output categories, output destinations. Now -v -V verbose works in sealert. - Resolves bug# 225161, granted AVCs incorrectly identified as a denial - add alert count to status bar - add 'Help' command to Help menu, opens web browser on wiki User FAQ [Dan Walsh ] - Make setroubleshoot.logrotate correctly[1.8.15-1]- Update po - Additional Plugins - Cleanup Plugins[1.8.14-1]- Resolved: bug# 221850 plugin module loading was failing in python 2.5 with the message 'SystemError: Parent module 'plugins' not loaded'. This is due to a change in behavior between python 2.4 and 2.5, in python 2.4 the lack of a parent module was silently ignored. The fix is to load plugins.__init__ first.[1.8.13-1]- update translations - change SETroubleshootDatabase so it is optional if its backed by a file, this fixes the problem of us littering temporary files when scanning logfiles which does not require persistence. - disable the view logfile menu item if no logfile has been opened - fix redundant log messages for case where there is no log file and the console flag is set. When there is no log file the logging module opens a console stream, thus the console stream produced by the console flag was redundant. - add username and password command line arguments rework startup logic so that all command line args are processed before we do any real work - rework the email preferences so that each email address can have a filter type associated with it. add a new filter_type 'Ignore After First Alert' which filters after the first alert has been delivered - add UI for setting the email addresses alerts are sent to. Add menu item to edit email list, add email list dialog. Remove 'recipient' config file entry, now list is stored in separate file. Add rpc to query and set the email list, the GUI calls this to get the current list from the server and set it in the server, it is the server which reads and writes the file. Add 'enable' flag to each email entry. Modify how the server iterates over the email list when it receives an alert. When marking an alert as having been sent the username is the email address but with 'email:' prepended so as not to collide with non-email filtering options for the same user.[1.8.12-1]- remove obsolete requires for python element treesetroubleshoot-plugins:[2.0.4-2]- change requires setroubleshoot to requires setroubleshoot-server[2.0.4-1]- Resolve: bug #431768: parser error in xmlParseDoc()[2.0.3-2]- remove dependency on policycoreutils - Related: bug #224351[2.0.2-1]- Add catchall_boolean.py plugin[2.0.1-1]- Resolve bug #332281: remove obsolete translation - Resolve bug #426586: Renaming translation po file from sr@Latn to sr@latin[2.0.0-1]- prepare for v2 test release[1.10.4-1]- Add allow_postfix_local_write_mail_spool plugin - Fix execute typo[1.10.3-1]- rewrite all plugins to use new v2 audit data[1.10.3-1]- Resolves bug #231762: Original PO strings bugs[1.10.2-1]- Change priority on use_nfs_home_dir to 55[1.10.1-1]- add BuildRequires perl-XML-Parser[1.10.0-1]- move all plugins and their translations from setroubleshoot-server package to this new independent package to allow easier updating of just the plugins"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2008-0061");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2008-0061.html");
script_cve_id("CVE-2007-5495","CVE-2007-5496");
script_tag(name:"cvss_base", value:"4.4");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"setroubleshoot", rpm:"setroubleshoot~2.0.5~3.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"setroubleshoot-plugins", rpm:"setroubleshoot-plugins~2.0.4~2.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"setroubleshoot-server", rpm:"setroubleshoot-server~2.0.5~3.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

