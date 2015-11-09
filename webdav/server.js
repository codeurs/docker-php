var jsDAV = require("jsDAV/lib/jsdav"),
	jsDAV_Locks_Backend_FS = require("jsDAV/lib/DAV/plugins/locks/fs"),
	jsDAV_Auth_Backend_File = require("jsDAV/lib/DAV/plugins/auth/file"),
	md5 = require('md5'),
	REALM = "jsdav"

require('fs').writeFileSync(__dirname+'/auth', [
	process.env.USERNAME, 
	REALM, 
	md5([process.env.USERNAME, REALM, process.env.PASSWORD].join(':'))
].join(':'))

jsDAV.createServer({
	node: "/var/webdav",
	locksBackend: jsDAV_Locks_Backend_FS.new("/var/webdav"),
	authBackend:  jsDAV_Auth_Backend_File.new(__dirname+'/auth'),
	realm: REALM
}, 80, '0.0.0.0')